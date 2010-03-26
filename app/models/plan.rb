class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :events
  has_many :lessons

  # validate_on_create :must_not_exceed_number_of_plans
  #  
  #  def must_not_exceed_number_of_plans
  #    errors.add("Plan", "Exceeds number of allowed plans") if user.plans.count > user.allowed_plans-1
  #  end
 

  def days
    @days ||= begin
      today = Time.now.to_date
      start_day = today
      # start_day = Date.parse("#{(today+1.year).year}-01-01")
      days = []
      (0..365).each do |d|
        date = start_day+d.days
        days<<Day.build(:date => date, :plan => self)
      end
    
      days.sort!{|a,b| a.date <=> b.date}
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
      # weeks.sort!{|a,b| a.start_date <=> b.start_date}
    end
  end

end
