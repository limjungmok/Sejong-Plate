OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  
  provider :facebook, '1722487254645787', '8762f3431beb7f0b1ca5e71e79b507bb', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}

end