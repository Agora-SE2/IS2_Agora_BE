ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'agora-se.herokuapp.com/',
  user_name:            ENV["asantamariap14"],
  password:             ENV["As98041465123"],
  authentication:       'plain',
  enable_starttls_auto: true 
}