class Notifier < ActionMailer::Base
  default_url_options[:host] = "theplanfor.us"

    def password_reset_instructions(user)
      subject     "Password Reset Instructions"
      from        "donotreply@theplanfor.us"
      recipients   user.email
      sent_on      Time.now
      body         :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
    end  
    
    def email_confirmation_instructions(user)
      subject     "Confirm Email Instructions"
      from        "donotreply@theplanfor.us"
      recipients   user.email
      sent_on      Time.now
      body         :email_confirmation_url => edit_email_confirmation_url(user.confirmation_token)      
    end
end
