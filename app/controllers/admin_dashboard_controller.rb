class AdminDashboardController < ApplicationController
  layout 'admin'

  before_action :authenticate

  def show
    @items = Item.all.paginate(page: params[:page],
                               per_page: 12)
    @items_public_data = @items.map { |item| ItemPublicData.new(item) }
  end

  private

  def authenticate
    redirect_to new_session_path if !logged_in?
  end
end
