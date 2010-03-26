# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def selected_class(path, root=root_path)
    if path==root
      return request.request_uri==root ? "selected": nil
    else
      return "selected" if request.request_uri.start_with?(path)
    end
  end

  def event_class(event)
    class_name = "secondary"
    class_name = "primary" if event.primary
    return class_name
  end

  def pluralize(number, singular)
    number==1 ? singular : singular.pluralize
  end

end
