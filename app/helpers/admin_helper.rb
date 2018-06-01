module AdminHelper
  def is_admin_route?
    request.env['PATH_INFO'].starts_with?('/admin') ||
        (request.env['PATH_INFO'].starts_with?('/user') && is_admin? && Integer(params[:id]) != @current_user.id)
  end

  def add_admin_flash
    if is_admin_route?
      flash.now[:danger] = "ADMIN INTERFACE"
    else
    end
  end
end
