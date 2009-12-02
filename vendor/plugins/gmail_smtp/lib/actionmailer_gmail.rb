ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => 587,
	:authentication => :plain,
	:domain => ENV['GMAIL_SMTP_USER'],
	:user_name => ENV['GMAIL_SMTP_USER'],
	:password => ENV['GMAIL_SMTP_PASSWORD'],
}


puts ENV['GMAIL_SMTP_USER']
puts ENV['GMAIL_SMTP_PASSWORD']
