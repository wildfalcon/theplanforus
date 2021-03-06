class PasswordResetsController < ApplicationController
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]  
  before_filter :require_no_user

  def create  
    @user = User.find_by_email(params[:email])  
    @user.deliver_password_reset_instructions! if @user  
    flash[:notice] = "Instructions to reset your password have been emailed to you. " +  
    "Please check your email. Instructions are only sent to email address we recognise"  
    redirect_to root_url  
  end  

  def update  
    @user.password = params[:user][:password]  
    @user.password_confirmation = params[:user][:password_confirmation]  
    if @user.save  
      flash[:notice] = "Password successfully updated"  
      redirect_to root_url
    else  
      render :action => :edit  
    end  
  end  
  
  private
  def load_user_using_perishable_token  
    @user = User.find_using_perishable_token(params[:id])  
    unless @user  
      flash[:notice] = "We're sorry, but we could not locate your account. " +  
      "If you are having issues try copying and pasting the URL " +  
      "from your email into your browser or restarting the " +  
      "reset password process."  
      redirect_to root_url  
    end
    @user
  end
end
