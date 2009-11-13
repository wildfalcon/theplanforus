class LeadsController < ApplicationController
  def create
    @lead = Lead.new(params[:lead])
    if @lead.save
      flash[:notice] = 'Email successfully saved'
      redirect_to(thank_you_path) 
    else
      redirect_to(signup_path)
    end

  end

end
