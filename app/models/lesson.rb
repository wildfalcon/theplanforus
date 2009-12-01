class Lesson < ActiveRecord::Base
  belongs_to :plan
  
  named_scope :upcoming, :conditions => ['date > ?', Time.now]
  named_scope :before, lambda { |date| { :conditions => ['date < ?', date] }}
  
end
