class EmailConfirmationsController < ApplicationController
  before_filter :load_user_using_confirmation_token, :only => :edit
  before_filter :require_user, :only => :create

  def create  
    current_user.deliver_email_confirmation_instructions!
    flash[:notice] = "An email with instructions to confirm your email address" +
    "has been sent to you. Please follow the instructions to confirm your email address)"
    redirect_to root_url
  end  

  def edit  
    @user.confirm!
    if @user.save  
      flash[:notice] = "Email address confirmed"  
      redirect_to root_url
    else  
      render :action => :edit  
    end  
  end  
  
  private
   def load_user_using_confirmation_token  
     @user = User.find_by_confirmation_token(params[:id])  
     unless @user  
       flash[:notice] = "We're sorry, but we could not locate your account. "
       redirect_to root_url  
     end
     @user
   end
end
