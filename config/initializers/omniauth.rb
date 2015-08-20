OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do

  provider :facebook, '157224744611812', '56adb5225ba91113339496e297415cef', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end