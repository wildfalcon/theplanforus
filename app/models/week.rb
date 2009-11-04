class Week
  
  #Active Record style build 
  def self.build(opts={})
    obj = self.new
    opts.each do |k,v|
      obj.send("#{k}=", v)
    end
    obj
  end

  attr_reader :start_date

  def date=(date)
    @start_date = date.beginning_of_week
  end
  

  def contains?(date)
    date > @start_date and date < start_date.end_of_week
  end

  def number
    start_date.strftime('%W')
  end

  def events
    @events ||= []
  end

  def has_major_event?
    !major_event.nil?
  end

  def major_event
    (events.select{|e| (e.class==Event and e.kind=="major")}||[]).first
  end
  
  def has_minor_event?
    !minor_event.nil?
  end

  def minor_event
    (events.select{|e| (e.class==Event and e.kind=="minor")}||[]).first
  end
end