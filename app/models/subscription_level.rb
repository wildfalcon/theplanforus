class SubscriptionLevel < ActiveRecord::Base

  def self.free
    self.find_by_name("Free")
  end
end
