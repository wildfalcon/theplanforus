class Event < ActiveRecord::Base
  belongs_to :plan
  
  default_scope :order  => "date"
  named_scope :primary, :conditions => {:primary => true} 
  named_scope :before, lambda { |date| { :conditions => ['date < ?', date] }}
  
  def summary
    name
  end
  
  def preceeding_lessons
    plan.lessons.before(self.date)
  end
  
  def preceeding_events
    plan.events.before(self.date)
  end
end
