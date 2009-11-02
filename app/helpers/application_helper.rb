# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def days
    ical_filename = "https://www.google.com/calendar/ical/dance%40wildfalcon.com/private-f3f01ef99b90b2bfc79ae7edcf5c7d3a/basic.ics"
    if ical_filename
      file = RIO.rio(ical_filename)
      today = Time.now
      @days = {}
      (0..180).each do |d|
        date = today+d.days
        @days["#{date.year}#{date.yday}"]={:date => date}
      end

      Icalendar.parse(file.read).first.events.each do |event|
        date = event.dtstart
        if @days["#{date.year}#{date.yday}"]
          @days["#{date.year}#{date.yday}"][:events] ||= []
          @days["#{date.year}#{date.yday}"][:events] << event
        end
      end
    end
    @days = @days.to_a.map{|t| t.last}

    @days.sort!{|a,b| a[:date] <=> b[:date]}
  end
end
