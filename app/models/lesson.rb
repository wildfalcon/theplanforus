class Lesson < ActiveRecord::Base
  belongs_to :plan
  
  named_scope :before, lambda { |date| { :conditions => ['date < ?', date] }}
  
end
