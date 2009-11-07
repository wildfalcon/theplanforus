module PlansHelper
  
  def week_class(week)
    class_name = ""
    class_name = "event" if week.has_event?
    class_name = "primary_event" if week.has_primary_event?
    return class_name
  end
  
  def event_class(event)
    class_name = "secondary"
    class_name = "primary" if event.primary
    return class_name
  end
end
