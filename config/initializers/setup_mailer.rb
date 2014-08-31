ActionMailer::Base.smtp_settings = {
  :address          => "smpt.mailgun.org",
  :port             => 587,
  :domain           => "mail.addressdmess.com",
  :user_name        => "postmaster@mail.addressdmess.com",
  :password         => ENV['ADM_EMAIL_PASSWORD'],
  :authentication   => "plain",
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
