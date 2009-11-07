# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def event_class(event)
    class_name = "secondary"
    class_name = "primary" if event.primary
    return class_name
  end


end
