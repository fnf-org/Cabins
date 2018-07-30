module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) unless session[:user_id].nil?
  end

  def is_current_user?(user)
    user == current_user
  end

  def logged_in?
    !session[:user_id].nil?
  end
end
