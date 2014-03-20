class ItemsController < ApplicationController
  def index
    if params[:query]
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
    items = Item.all
    @items_public_data = items.map { |item| ItemPublicData.new(item) }
  end

  def search_response
    items = ItemGlobalSearch.new(params[:query]).items
    @items_public_data = items.map { |item| ItemPublicData.new(item) }
    @query_header = query_header_for_query(params[:query], items.present?)
  end

  def query_header_for_query(query, any_search_results)
    if any_search_results
      "Showing search results for \"#{query}\""
    else
      "No search results for \"#{query}\""
    end
  end
end
