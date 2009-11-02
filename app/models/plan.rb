class Plan < ActiveRecord::Base
  has_many :events

  def days
    @days ||= begin
      today = Time.now.to_date
      start_day = Date.parse("#{(today+1.year).year}-01-01")
      days = {}
      (0..364).each do |d|
        date = start_day+d.days
        days["#{date.year}#{date.yday}"]=Day.new(date)
      end
      
      
      ical_filename = "https://www.google.com/calendar/ical/dance%40wildfalcon.com/private-f3f01ef99b90b2bfc79ae7edcf5c7d3a/basic.ics"
      if ical_filename
        file = RIO.rio(ical_filename)  
        Icalendar.parse(file.read).first.events.each do |event|
          date = event.dtstart
          if days["#{date.year}#{date.yday}"]
            days["#{date.year}#{date.yday}"].events << event
          end
        end
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
end
