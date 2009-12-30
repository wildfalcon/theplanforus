class Preparation < ActiveRecord::Base
  belongs_to :plan
  
  default_scope :order  => "date"
  named_scope :upcoming, :conditions => ['date > ?', Time.now]
  named_scope :before, lambda { |date| { :conditions => ['date < ?', date] }}
  
end