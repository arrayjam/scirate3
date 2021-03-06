class SessionsController < ApplicationController
  def new
  end

  def create
    session[:return_to] = params[:return_to] if params[:return_to]

    user = User.find_by_email(params[:email_or_username]) ||
           User.find_by_username(params[:email_or_username])

    if user && user.authenticate(params[:password])
      sign_in user, remember_me: (params[:remember_me] == "1")
      redirect_back_or user
    else
      flash.now[:error] = "Invalid email/password combination"
      render 'new'    
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
