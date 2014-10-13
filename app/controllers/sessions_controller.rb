class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.where(email: params[:email]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, you've logged in."
      redirect_to  edit_user_path(user.id)
    else
      flash[:error] = "I can't authenticate with this email and password."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've logged out."
    redirect_to login_path
  end
end

