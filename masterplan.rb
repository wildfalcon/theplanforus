require 'rubygems'
require 'activesupport'
require 'actionpack'
require 'sinatra'
require 'icalendar'
require 'rio'
require 'erb'

require 'ruby-debug'

get '/' do
  file = RIO.rio("https://www.google.com/calendar/ical/dance%40wildfalcon.com/private-487b33af7da6bc2ab99e9c93b1d1d4ea/basic.ics")
  today = Time.now
  @days = {}
  (0..180).each do |d|
    date = today+d.days
    @days["#{date.year}#{date.yday}"]={:date => date}
  end
  
  "Hello"
    # Parser returns an array of calendars because a single file
    # can have multiple calendars.
    cals = Icalendar.parse(file.read)
    cal = cals.first
    
    cal.events.each do |event|
      date = event.dtstart
      if @days["#{date.year}#{date.yday}"]
        @days["#{date.year}#{date.yday}"][:events] ||= []
        @days["#{date.year}#{date.yday}"][:events] << event
      end
    end
    
    @days = @days.to_a.map{|t| t.last}

    @days.sort!{|a,b| a[:date] <=> b[:date]}
    
    erb :calendar
end
