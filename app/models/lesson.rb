class Lesson < Preparation
  belongs_to :plan
  
  default_scope :order  => "date"
  named_scope :upcoming, :conditions => ['date > ?', Time.now]
  named_scope :before, lambda { |date| { :conditions => ['date < ?', date] }}
  
  def date_string=(date_string)
    write_attribute(:date, Date.parse(date_string))
  end
  
  def date_string
    self.date ? self.date.strftime("%Y-%m-%d") : ""
  end
  
end
