class Event < ActiveRecord::Base
  belongs_to :plan
  
  default_scope :order  => "date"
  
  def summary
    name
  end
end
