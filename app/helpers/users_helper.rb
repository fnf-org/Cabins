module UsersHelper
  def allowed_to_book?
    is_admin? || Reservation.find_by_user_id(current_user.id).nil?
  end
end
