module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def meta_description(page_meta_description)
    content_for(:meta_description) { page_meta_description }
  end

  def heading(page_heading)
    content_for(:heading) { page_heading }
  end

  def humanize_boolean(input)
    input ||= ''
    case input.to_s.downcase
    when 't', 'true'
      'Yes'
    else
      'No'
    end
  end

  def css_for_boolean(input)
    if input
      'success'
    else
      'danger'
    end
  end

  def user_has_reservation
    Reservation.find_by_user_id(session[:user_id]).nil? ? false : true
  end

  def mobile_device?
   if session[:mobile_param]
     session[:mobile_param] == "1"
   else
     request.user_agent =~ /Mobile|webOS/
   end
  end

  def get_nav_class(page)
    if request.env['PATH_INFO'].starts_with?('/' + page)
      'active'
    else
      ''
    end
  end

end
