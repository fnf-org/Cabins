Rails.application.configure do
  config.lograge.enabled = true

  config.lograge.custom_payload do |controller|
    user = if defined? controller.current_user
             controller.current_user.try(:id)
           else
             ''
           end
    {
        ip: controller.request.ip,
        user_id: user
    }
  end
end