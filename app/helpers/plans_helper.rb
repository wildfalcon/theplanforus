module PlansHelper
  
  def week_class(week)
    week.has_event? ? "event" : ""
  end
  
  def day_class(day)
    classes=[]
        classes << "weekend"      if day.weekend?
    classes << "lesson"           if day.has_lesson?
    classes << "event"            if day.has_event?
    classes << "last_of_month"    if day.last_day_of_month?
    return classes.join(" ")
  end
end
