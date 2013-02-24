Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vkontakte, '3450194', '6M0adRM8Bw6QcaxoKa0T', {
  	:scope => 'offline,wall'
  }
end

OmniAuth.config.on_failure = Proc.new do |env| new_path = "/auth/failure"
end