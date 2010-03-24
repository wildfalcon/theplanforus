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
      (0..user.timeline_limit-1).each do |d|
        date = start_day+d.days
        days<<Day.build(:date => date, :plan => self)
      end
    
      days.sort!{|a,b| a.date <=> b.date}
    end
  end

  def weeks
    @weeks ||= begin
      weeks = []
      today = Time.now.beginning_of_week
      start_of_last_week = (Time.now+user.timeline_limit.days).beginning_of_week
      number_of_weeks = (start_of_last_week-today)/(24*60*60*7)
      
      (0..number_of_weeks).each do |w|
        date=today+w.weeks
        weeks<<Week.build(:date => date.to_date, :plan => self)
      end
      
      weeks.sort!{|a,b| a.start_date <=> b.start_date}
    end
  end

end
