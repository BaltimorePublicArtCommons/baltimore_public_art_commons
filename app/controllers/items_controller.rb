class ItemsController < ApplicationController
  def index
    if params[:query]
      @items = ItemGlobalSearch.new(params[:query]).items
      @query_header = query_header_for_query(params[:query], @items.present?)
    else
      @items = Item.all
    end
  end

  def show
    @item_public_data = ItemPublicData.new(Item.find(params[:id]))
  end

  private

  def query_header_for_query(query, any_search_results)
    if any_search_results
      "Showing search results for \"#{query}\""
    else
      "No search results for \"#{query}\""
    end
  end
end
