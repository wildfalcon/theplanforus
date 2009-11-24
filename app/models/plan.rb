class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :events
  has_many :lessons

  def days
    @days ||= begin
      today = Time.now.to_date
      start_day = today
      # start_day = Date.parse("#{(today+1.year).year}-01-01")
      days = []
      (0..364).each do |d|
        date = start_day+d.days
        days<<Day.build(:date => date, :plan => self)
      end
    
      days.sort!{|a,b| a.date <=> b.date}
    end
  end

  def weeks
    @weeks ||= begin
      weeks = []
      today = Time.now.to_date.beginning_of_week
      (0..51).each do |w|
        date=today+w.weeks
        weeks<<Week.build(:date => date, :plan => self)
      end
      
      weeks.sort!{|a,b| a.start_date <=> b.start_date}
    end
  end

end
