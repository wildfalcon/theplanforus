class UsersController < ApplicationController
  def new  
    @user = User.new  
  end  

  def create  
    @user = User.new(params[:user])  
    if @user.save  
      current_user.deliver_email_confirmation_instructions!
      flash[:notice] = "Registration successful. An email with instructions to confirm your email address " +
      "has been sent to you. Please follow the instructions to confirm your email address"
      redirect_to root_url
    else  
      render :action => 'new'  
    end  
  end

  def edit  
    @user = current_user  
  end  

  def delete
    current_user.destroy
    flash[:notice] = "Your account as been successfully deleted"
    redirect_to root_url
  end  

  def update  
    @user = current_user  
    if @user.update_attributes(params[:user])  
      flash[:notice] = "Successfully updated profile."  
      redirect_to root_url  
    else  
      render :action => 'edit'  
    end  
  end
end
