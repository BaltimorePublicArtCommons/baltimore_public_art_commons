class AdminDashboardController < ApplicationController
  layout 'admin'

  before_action :authenticate

  def show
  end

  private

  def authenticate
    redirect_to new_session_path if !logged_in?
  end
end
