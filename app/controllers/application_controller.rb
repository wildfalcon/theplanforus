# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  map_enclosing_resource :plan do
    current_user.plans.find(params[:plan_id])
  end
  
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  helper_method :current_user  

  private  
  def current_user_session  
    @current_user_session ||= UserSession.find  
  end  

  def current_user  
    @current_user ||= current_user_session && current_user_session.record  
  end

  def logged_in?
    !!current_user
  end

  def login_required
    logged_in? || access_denied
  end

  def access_denied
    flash[:error] = "You need to be logged in to access this page"
    redirect_to login_path
  end
end
