class EventsController < ApplicationController
  resources_controller_for :events
  
  
  def create
     @resource = @event = Event.new(params[:event])
     @event.plan_id = params[:plan_id]
     if @event.save
       flash[:notice] = 'Event was successfully created.'
       redirect_to(plan_events_url) 
     else
       render :action => "new" 
     end

   end

end
