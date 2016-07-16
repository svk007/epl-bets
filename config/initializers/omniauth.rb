OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '926954470767330', '786d131c860ad9858527fea070cee6f0'
end