class EventsController < ApplicationController
  resources_controller_for :events
  before_filter :require_user
  before_filter :set_layout

  def index
    @plan = current_user.plan
    @events = @plan.events.upcoming
  end


  def create
    self.resource = new_resource

    if resource.save
      respond_to do |format|
        flash[:notice] = 'Event was successfully created.'
        format.html {redirect_to :back}
      end
    else
      render :action => "new" 
    end
  end
  
  private
  def set_layout
    @sub_layout = 'plans'
  end
end

