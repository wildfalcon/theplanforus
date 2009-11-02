class Event < ActiveRecord::Base
  belongs_to :plan
  
  def summary
    name
  end
end
