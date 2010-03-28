class Day
  #Active Record style build 
  def self.build(opts={})
    obj = self.new
    opts.each do |k,v|
      obj.send("#{k}=", v)
    end
    obj
  end

  
  attr_accessor :date, :plan  
    

  
  def events
    @events ||= begin
      plan.events.select{|e| self.date==e.date}
    end
  end
  
  def lessons 
    @lessons ||= begin
      plan.lessons.select {|l| self.date==l.date}
    end
  end
  
  def html_id
    "day_#{date.strftime("%Y_%j")}"
  end
  
  def has_lesson?
    lessons.size>0
  end
  
  def has_primary_event?
    primary_events.size>0
  end
  
  def primary_events
    events.select{|e| e.primary}||[]
  end
  
  def has_event?
    events.size>0
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