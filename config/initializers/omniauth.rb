OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['535495026620300'], ENV['e3193b4e8be8b2ecf918b477abd9dada']
end