class SubscriptionLevel < ActiveRecord::Base

  validates_numericality_of :allowed_plans, :greater_than => 0
  validates_numericality_of :timeline_limit, :greater_than => 0
  

  def self.free
    self.find_by_name("Free")
  end
end
