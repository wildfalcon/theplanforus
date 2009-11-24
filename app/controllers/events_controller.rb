class EventsController < ApplicationController
  resources_controller_for :events



  def create
    self.resource = new_resource

    if resource.save
      respond_to do |format|
        flash[:notice] = 'Event was successfully created.'
        format.html {redirect_to :back}
        format.js  {@events = enclosing_resource.events}
      end
    else
      render :action => "new" 
    end

  end
end

