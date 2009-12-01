class HomeController < ApplicationController

  def index
    redirect_to account_url if current_user 
  end
end
