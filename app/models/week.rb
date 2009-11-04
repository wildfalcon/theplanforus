class Week

  attr_reader :start_date

  def initialize(date)
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
end