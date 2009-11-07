module PlansHelper
  
  def week_class(week)
    class_name = ""
    class_name = "event" if week.has_event?
    class_name = "primary_event" if week.has_primary_event?
    return class_name
  end
  
  def day_class(day)
    classes=[]
    classes << "weekend"   if day.weekend?
    classes << "lesson"    if day.has_lesson?
    classes << "primary"   if day.has_primary_event?
    classes << "secondary" if day.has_event?
    return classes.join(" ")
  end
end
