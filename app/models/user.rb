class User < ActiveRecord::Base
  acts_as_authentic

  has_one :plan
  after_create :create_plan

  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    Notifier.deliver_password_reset_instructions(self)  
  end
  
  def deliver_email_confirmation_instructions!
    self.confirmation_token=self.perishable_token
    reset_perishable_token!
    self.confirmed_at = nil
    self.confirmation_sent_at = Time.now.utc
    self.save
    Notifier.deliver_email_confirmation_instructions(self)
  end

  def confirm!
    self.confirmed_at=Time.now.utc
    self.confirmation_token=nil
  end
end
