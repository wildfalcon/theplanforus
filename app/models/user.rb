class User < ActiveRecord::Base
  acts_as_authentic

  has_many :plans
  belongs_to :subscription_level

  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    Notifier.deliver_password_reset_instructions(self)  
  end

  def subscription_level
    id = read_attribute(:subscription_level_id)
    if id
      level = SubscriptionLevel.find(id) 
    else
      level = SubscriptionLevel.free
    end
  end
end
