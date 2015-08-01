class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      log_in user
      redirect_to admin_path
    else
      flash.alert = 'The credentials you entered are invalid. Please try again.'
      render :new
    end
  end
end
