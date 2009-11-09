class LessonsController < ApplicationController
  resources_controller_for :lessons
  
  
  def create
     @resource = @lesson = Lesson.new(params[:lesson])
     @lesson.plan_id = params[:plan_id]
     if @lesson.save
       flash[:notice] = 'lesson was successfully created.'
       redirect_to(plan_lessons_url) 
     else
       render :action => "new" 
     end

   end

end