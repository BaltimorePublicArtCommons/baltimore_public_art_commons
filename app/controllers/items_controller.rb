class ItemsController < ApplicationController
  def index
    if params[:query].present?
      search_response
    else
      index_response
    end
  end

  def show
    @item_public_data = ItemPublicData.new(Item.find(params[:id]))
  end

  private

  def index_response
    @items = Item.all.paginate(page: params[:page],
                               per_page: 12)
    @items_public_data = @items.map { |item| ItemPublicData.new(item) }
  end

  def search_response
    @items = ItemGlobalSearch.new(params[:query]).items.paginate(page: params[:page],
                                                                 per_page: 12)
    @items_public_data = @items.map { |item| ItemPublicData.new(item) }
    @query_header = query_header_for_query(params[:query], @items.present?)
  end
end
