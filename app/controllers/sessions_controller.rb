class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      redirect_to root_url, notice: ("Logged in as " + user.first_name)
    else
      flash.alert = 'The credentials you entered are invalid. Please try again.'
      render :new
    end
  end
end
