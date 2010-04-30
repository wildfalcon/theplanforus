class LessonsController < ApplicationController
  before_filter :set_layout

  resources_controller_for :lessons

  def index
    @lessons = enclosing_resource.lessons.upcoming
  end

  def create
    @resource = @lesson = Lesson.new(params[:lesson])
    @lesson.plan_id = params[:plan_id]
    if @lesson.save
      flash[:notice] = 'lesson was successfully created.'
      redirect_to(plan_path(params[:plan_id])) 
    else
      render :action => "new" 
    end
  end

  def list
    @lessons = enclosing_resource.lessons.upcoming
  end

  protected

  def set_layout
    @sub_layout = 'plans'
    @plan = enclosing_resource
  end


end