class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :update]
  before_action :correct_user, only: [:show, :update]
  before_action :require_admin, only: [:tier_approved]

  def new
    @user = User.new
    @error = @user # tell _error_messages.html.erb to use this object for form errors
  end

  def create
    @user = User.new(user_params)
    @error = @user # tell _error_messages.html.erb to use this object for form errors

    set_planner_found
    if @user.save
      logger.info "user registered - id: #{@user.id} email: #{@user.email}"
      log_in @user
      @user.send_pre_registration_email
      flash[:success] = 'Thank you for pre-registering!'
      redirect_to home_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @error = @user
  end

  def reservations
    @user = User.find(params[:id])
    @error = @user

    if @user.reservations.empty?
      redirect_to accommodations_path
      return
    end
  end

  def update
    logger.info "user updated - id: #{@user.id} by user #{@current_user.id}"
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    @user = User.find(params[:id])
    before_tier = @user.tier_id
    @error = @user # tell _error_messages.html.erb to use this object for form errors

    set_planner_found
    if @user.update_attributes(user_params)
      flash[:success] = 'user updated'
      if is_admin?
        @registrations = User.all
        redirect_to registrations_path
      else
        @posts = Post.where(category: 'home').order(display_order: :asc, id: :asc)
        redirect_to home_path
      end
    else
      render 'show'
    end
  end

  def tier_approved
    @user = User.find(params[:id])
    if (!@user.tier.nil?)
      @user.send_tier_approved_email
      @user.tier_approved_email = DateTime.now
      @user.save

      logger.info "admin #{@current_user.email} approved tier #{@user.tier.label} for user id: #{@user.id} email: #{@user.email}"
      flash.now[:success] = 'tier approval email sent'
    else
      flash.now[:danger] = 'please set the tier first'
    end

    @registrations = User.all
    redirect_to registrations_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :role, :notes, :tier_id, :privacy)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless is_current_user?(@user) || is_admin?
  end

  def set_planner_found
    planner = Planner.where(email: params[:user][:email].blank? ? @user.email : params[:user][:email])
    @user.planner_found = planner.blank? ? false : true

    if (@user.planner_found && params[:user][:tier_id].blank?)
      logger.info "found matching planner email and setting tier - id: #{@user.id} email: #{@user.email}"
      tier = Tier.find_by(label: 'Tier 2')
      if (@user.id.blank?)
        @user.tier = tier unless tier.nil?
      else
        params[:user][:tier_id] = tier.id unless tier.nil?
      end

      if is_admin?
        flash.now[:info] = "Planner email '#{@user.email}' recognized and automagically moved to #{tier.label}"
      end
    end
  end
end
