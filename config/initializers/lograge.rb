Rails.application.configure do
  config.lograge.enabled = true

  config.lograge.custom_payload do |controller|
    {
        ip: controller.request.ip,
        user_id: defined? controller.current_user ? '-' : controller.current_user.try(:id)
    }
  end
end