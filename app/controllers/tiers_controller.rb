class TiersController < ApplicationController
  before_action :require_admin

  def index
    @tiers = Tier.all()
  end

  def show
    @tier = Tier.find(params[:id])
    @error = @tier
  end

  def update
    @tier = Tier.find(params[:id])
    @error = @tier # tell _error_messages.html.erb to use this object for form errors

    if @tier.update_attributes(tier_params)
      flash[:success] = 'tier updated'
      index
      redirect_to tiers_path
    else
      render 'show'
    end
  end

  def tier_open_email_confirm
    @tier = Tier.find(params[:id])
    @error = @tier

    if !@tier.valid?
      flash.now[:warning] = "Tier is invalid, please edit first"
      render 'show'
    end
  end

  def tier_open_email_send
    logger.info("sending open email")
    @tier = Tier.find(params[:id])
    @error = @tier

    for u in @tier.users do
      UserMailer.tier_open_email(u).deliver_now
      EmailLog.create(email_type: 'tier_open_email', user: u, tier: @tier)
    end
    flash[:success] = "tier opening email sent for #{@tier.description} tier."
    index
    @tier.sent_date=Time.new
    @tier.save
    redirect_to tiers_path
  end

  private
    def tier_params
      params.require(:tier).permit(:label, :description, :available, :email_text, :email_html, :subject)
    end
end
