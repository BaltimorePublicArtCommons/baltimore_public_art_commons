class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item_public_data = ItemPublicData.new(Item.find(params[:id]))
  end
end
