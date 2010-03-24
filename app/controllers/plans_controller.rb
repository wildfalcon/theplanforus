class PlansController < ApplicationController
  before_filter :require_user, :except => :ical

  def index
    @plans = current_user.plans
  end

  def weekly
    @plan = current_user.plans.find(params[:id])
  end

  def daily
    @plan = current_user.plans.find(params[:id])
  end

  def show
    @plan = current_user.plans.find(params[:id])
  end


  def new
    @plan = current_user.plans.new
  end

  def edit
    @plan = current_user.plans.find(params[:id])
  end

  def ical
    cal = Icalendar::Calendar.new

    Plan.find(params[:id]).lessons.all.each do |lesson|
      event = Icalendar::Event.new
      event.start = lesson.start
      event.end = lesson.end
      event.summary = lesson.description
      cal.add_event(event)
    end

    @calendar = cal.to_ical
    render :layout => false
  end

  def create
    @plan = current_user.plans.new(params[:plan])
    if @plan.save
      flash[:notice] = 'Plan was successfully created.'
      redirect_to(@plan) 
    else
      render :action => "new" 
    end

  end

  def update
    @plan = current_user.plans.find(params[:id])
    if @plan.update_attributes(params[:plan])
      flash[:notice] = 'Plan was successfully updated.'
      redirect_to(@plan) 
    else
      render :action => "edit" 
    end
  end

  def destroy
    @plan = current_user.plans.find(params[:id])
    @plan.destroy
    redirect_to(plans_url)
  end

end
