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
  attr_accessor :plan

  def date=(date)
    @start_date = date.beginning_of_week
  end
  
  def contains?(date)
    date >= @start_date and date <= @start_date.end_of_week
  end

  def number
    start_date.strftime('%W')
  end

  def events
    @events ||= []
  end
  
  def lessons 
    @lessons ||= begin
      plan.lessons.select {|l| self.contains?(l.date)}
    end
  end

  def has_primary_event?
    primary_events.size>0
  end

  def primary_events
    events.select{|e| e.primary}||[]
  end
  
  def has_event?
    events.size > 0
  end
end