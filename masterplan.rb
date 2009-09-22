require 'rubygems'
require 'activesupport'
require 'actionpack'
require 'sinatra'
require 'icalendar'
require 'rio'
require 'erb'

get '/' do
  ical_filename = ENV['MASTERPLAN_FILENAME']

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

    @days = @days.to_a.map{|t| t.last}

    @days.sort!{|a,b| a[:date] <=> b[:date]}

    erb :calendar
  else
    'Please set the environment var "masterplan_filename"'
  end
end
