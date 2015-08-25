OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '653008728132853', '4ca1263303f1ec9c80b3e828d6b362dc', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}

end