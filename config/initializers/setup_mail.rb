ActionMailer::Base.smtp_settings = {
  address:             'smtp.gmail.com',
  port:                '587',
  domain:              'publicartcommons.org',
  user_name:           'publicartcommons',
  password:            'B\'moreart',
  authentication:      'plain',
  enable_starttls_auto: true
}