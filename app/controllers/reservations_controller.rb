class ReservationsController < ApplicationController
  before_action :require_admin,   only: [:index, :update, :delete]
  before_action :purge_expired_reservations

  def new
    @reservation = Reservation.new
    @error = @reservation
  end

  def create
    # check that they don't already have a reservation
    existing_reservation = Reservation.find_by_user_id(current_user.id)
    if (!is_admin? && !existing_reservation.nil?)
      flash.now[:danger] = 'What are you doing, you already have a reservation!'
      @user = User.find(current_user.id)
      @error = @user
      render 'users/show'
      return
    end

    # create the initial reservation record
    @reservation = Reservation.new
    @reservation.quantity = 1
    @reservation.user = current_user
    @error = @reservation

    # check that the accommodation is still available
    @accommodation = Accommodation.find(params[:accommodation_id])
    @quantity_available = quantity_available?(@accommodation)

    if (@quantity_available == 0)
      redirect_to(accommodations_path, {:flash => {:danger => 'Sorry, looks like someone grabbed that one out from under you'}})
      return
    end

    @reservation.accommodation = @accommodation
    @reservation.price = @accommodation.price
    if @reservation.save
      render 'reservations/new'
    else
      redirect_to(accommodations_path, {:flash => {:danger => 'An unexpected error occurred: ' + @reservation.errors.messages.inspect }})
    end
  end

  def confirmation
    @reservation = Reservation.find_by(:id => params[:id])
    if (!@reservation)
      redirect_to(accommodations_path, {:flash => {:danger => 'Sorry, your reservation expired because you did not confirm it within 10 minutes.'}})
      return
    end
    @error = @reservation

    if (is_admin? && params[:reservation][:user_id])
      @reservation.user = User.find(params[:reservation][:user_id])
    else
      @reservation.user = current_user
    end
    @reservation.quantity = params[:reservation][:quantity]
    @reservation.price = @reservation.accommodation.price * @reservation.quantity
    @accommodation = @reservation.accommodation
    @error = @reservation # tell _error_messages.html.erb to use this object for form errors
    @reservation.confirmed_time = DateTime.now

    if @reservation.save
      @reservation.send_booking_confirmation_email
      render 'confirmation'
    else
      new
    end
  end

  def cancel
    query = Reservation.where('id=? AND confirmed_time IS NULL', params[:id])
    if (!is_admin?)
      query.where('user_id=?', current_user.id)
    end

    @reservation = query
    if (@reservation)
      @reservation.first().destroy
    end

    redirect_to accommodations_path
  end

  # ADMIN -----------------------------------

  def index
    @reservations = Reservation.search(params).order(sort).page(params[:page])
  end

  def sort
    if ("user".eql?(params[:sort]))
      "u.name #{params[:direction]}, id"
    elsif ("accommodation".eql?(params[:sort]))
      "a.label #{params[:direction]}, id"
    elsif (Reservation.column_names.include?(params[:sort]) && %w[asc desc].include?(params[:direction]))
      "#{params[:sort]} #{params[:direction]}, id"
    else
      :id
    end
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def delete
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:success] = "reservation #{@reservation.id} deleted"

    index
    redirect_to admin_reservations_path
  end

  def payment
    @reservation = Reservation.find(params[:id])
    @error = @reservation # tell _error_messages.html.erb to use this object for form errors
  end

  def paid
    @reservation = Reservation.find(params[:id])
    @error = @reservation # tell _error_messages.html.erb to use this object for form errors

    if @reservation.update_attributes(reservation_params) && @reservation.update(paid_date: DateTime.now(), processed_by_user_id: current_user.id)
      flash[:success] = "reservation #{@reservation.id} marked as paid"
      index
      @reservation.send_paid_confirmation_email
      redirect_to admin_reservations_path
    else
      redirect_to admin_reservations_path
    end
  end

  private
    def reservation_params
      params.require(:reservation).permit(:price, :quantity, :accommodation_id, :payment_amount, :payment_types_id)
    end
end
