class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  helper_method :is_admin?
  def is_admin?
    current_user ||= User.find_by(id: session[:user_id])
    !current_user.nil? && current_user.admin
  end

  def require_admin
    unless is_admin?
      flash[:danger] = 'access denied'
      redirect_to home_path
    end
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  helper_method :quantity_available?
  def quantity_available?(accommodation)
    @connection = ActiveRecord::Base.connection
    result = @connection.exec_query(
        "SELECT a.hold, a.quantity - IFNULL(r.reserved_count, 0) AS quantity "\
        "FROM accommodations a LEFT OUTER JOIN "\
        "(SELECT accommodation_id, SUM(quantity) AS reserved_count FROM reservations WHERE accommodation_id=#{accommodation.id} GROUP BY accommodation_id) "\
        "r ON r.accommodation_id=a.id WHERE a.id=#{accommodation.id}")

    if (result[0]['hold'].to_i.eql?(0) || is_admin?)
      return result[0]['quantity'].to_i
    end

    0
  end

  helper_method :sku
  def sku(reservation)
    "#{reservation.id}-#{reservation.accommodation.building.id}-#{reservation.accommodation.id}-#{reservation.user_id}"
  end

  def purge_expired_reservations
    Reservation.where('confirmed_time IS NULL AND created_at < ?', Time.now - (60 * 5)).destroy_all
  end
end
