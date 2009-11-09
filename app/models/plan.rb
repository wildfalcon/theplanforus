class Plan < ActiveRecord::Base
  has_many :events
  has_many :lessons

  def days
    @days ||= begin
      today = Time.now.to_date
      start_day = today
      # start_day = Date.parse("#{(today+1.year).year}-01-01")
      days = {}
      (0..364).each do |d|
        date = start_day+d.days
        days["#{date.year}#{date.yday}"]=Day.build(:date => date)
      end
      
      events.each do |event|
        date = event.date
        if days["#{date.year}#{date.yday}"]
          days["#{date.year}#{date.yday}"].events << event
        end
      end

      days = days.to_a.map{|t| t.last}
      days.sort!{|a,b| a.date <=> b.date}
    end
  end

  def weeks
    @weeks ||= begin
      weeks = {}
      today = Time.now.to_date.beginning_of_week
      (0..51).each do |w|
        date=today+w.weeks
        weeks["#{date.year}#{date.yday}"]=Week.build(:date => date)
      end
      
      events.each do |event|
        date = event.date.beginning_of_week
        if weeks["#{date.year}#{date.yday}"]
          weeks["#{date.year}#{date.yday}"].events << event
        end
      end
      weeks = weeks.to_a.map{|t| t.last}
      weeks.sort!{|a,b| a.start_date <=> b.start_date}
    end
  end

end
