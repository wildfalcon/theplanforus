class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :events
  has_many :lessons

  def days(start_date = Time.now, end_date = Time.now+365.days)
    start_date ||= Time.now
      end_date ||= Time.now+365.days
      
    start_date = start_date.to_date
      end_date = end_date.to_date
  
    number_of_days = end_date - start_date
    
    @days = begin
      days = []
      (0..number_of_days).each do |d|
        date = start_date+d.days
        days << Day.build(:date => date, :plan => self)
      end
      days
    end
  end

  def weeks(start_date = Time.now, end_date = Time.now+365.days)
    #work with dates, then differences are in day not milliseconds
    start_date ||= Time.now
      end_date ||= Time.now+365.days

    start_date = start_date.to_date
      end_date = end_date.to_date
          
    start_of_first_week = start_date.beginning_of_week
    start_of_last_week  = end_date.beginning_of_week
    number_of_weeks = ((start_of_last_week - start_of_first_week)/(7))
    @weeks = begin
      weeks = []
      (0..number_of_weeks).each do |w|
        date=start_of_first_week+w.weeks
        weeks << Week.build(:date => date.to_date, :plan => self)
      end
      weeks
    end
  end

end
