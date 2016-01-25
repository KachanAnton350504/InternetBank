OmniAuth.config.logger = Rails.logger



Rails.application.config.middleware.use OmniAuth::Builder  do 
  provider :facebook , '535495026620300' , 'e3193b4e8be8b2ecf918b477abd9dada' 
end