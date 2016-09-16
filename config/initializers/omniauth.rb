OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '157224744611812', '56adb5225ba91113339496e297415cef'

end

