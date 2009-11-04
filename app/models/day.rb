class Day
  def self.days
    today = Time.now.to_date
    
    start_day = Date.parse("#{(today+1.year).year}-01-01")
    @days = {}
    (0..180).each do |d|
      date = start_day+d.days
      @days["#{date.year}#{date.yday}"]=Day.new(date)
    end
    
    ical_filename = "https://www.google.com/calendar/ical/dance%40wildfalcon.com/private-f3f01ef99b90b2bfc79ae7edcf5c7d3a/basic.ics"
    if ical_filename
      file = RIO.rio(ical_filename)  
      Icalendar.parse(file.read).first.events.each do |event|
        date = event.dtstart
        if @days["#{date.year}#{date.yday}"]
          @days["#{date.year}#{date.yday}"].events << event
        end
      end
    end
    
    @days = @days.to_a.map{|t| t.last}
    @days.sort!{|a,b| a.date <=> b.date}
  end
  
  attr_accessor :date
  
  def initialize(date)
    self.date = date
  end
  
  def events
    @events ||= []
  end
  
  def has_major_event?
    events.select{|e| (e.class==Event and e.kind=="major")}.size>0
  end
  
  def weekend?
    self.date.wday== 6 or self.date.wday== 0
  end
  
  
  def first_day_of_month?
    self.date.day == 1
  end

  def display_date
    if first_day_of_month?
      self.date.strftime("%a %e %b") 
    else
      self.date.strftime("%a %e") 
    end
  end
end