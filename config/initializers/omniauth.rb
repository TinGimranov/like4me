Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vkontakte, '3447810', 'VMTl4uqW7Tjh7JH5SE4k'
end

OmniAuth.config.on_failure = Proc.new do |env| new_path = "/auth/failure"
end