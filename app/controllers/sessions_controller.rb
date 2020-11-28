class SessionsController < ApplicationController
  
  def new
  end
  
  #Post LOGIN
 def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
 end
 
 def current_user
   if session[:user_id]
     User.find_by(id:session[:user_id])
   end
 end
 
 def destroy
     log_out if logged_in?
     redirect_to root_url
 end 
end
