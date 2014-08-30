ActionMailer::Base.smtp_settings = {
  :address          => "mail.addressdmess.com",
  :port             => 25,
  :domain           => "addressdmess.com",
  :user_name        => "approvals@addressdmess.com",
  :password         => ENV['ADM_EMAIL_PASSWORD'],
  :authentication   => "plain",
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
