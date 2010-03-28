class Event < ActiveRecord::Base
  belongs_to :plan
  
  default_scope :order  => "date"
  named_scope :primary, :conditions => {:primary => true} 
  named_scope :upcoming, :conditions => ['date > ?', Time.now]
  named_scope :before, lambda { |date| { :conditions => ['date < ?', date] }}
  
  def summary
    name
  end
  
  def date_string=(date_string)
    write_attribute(:date, Date.parse(date_string))
  end
  
  def date_string
    self.date ? self.date.strftime("%Y/%m/%d") : ""
  end
  
  def day
    Day.build(:date => self.date, :plan => self.plan)
  end
  
  def week
    Week.build(:date => self.date.beginning_of_week, :plan => self.plan)
  end
  
  def preceeding_lessons
    plan.lessons.before(self.date)
  end
  
  def preceeding_events
    plan.events.before(self.date)
  end
  
  def number_of_days_remaining
    (self.date-Time.now.to_date).to_i
  end
end
