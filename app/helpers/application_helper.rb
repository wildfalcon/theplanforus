# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def selected_class(path, root=root_path)
    puts "#{path} - #{root}"
    if path==root
      return request.request_uri==root ? "selected": nil
    else
      return "selected" if request.request_uri.start_with?(path)
    end
  end


  def pluralize(number, singular)
    number==1 ? singular : singular.pluralize
  end

end
