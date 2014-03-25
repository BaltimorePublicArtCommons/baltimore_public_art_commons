class ItemGlobalSearch
  def initialize(query)
    @query = query
  end

  def items
    search_results = PgSearch.multisearch(@query)

    item_ids = search_results.map do |search_result|
      if search_result.searchable_type == 'Item'
        search_result.searchable_id
      elsif search_result.searchable_type == 'Artist'
        ItemArtist.where(artist_id: search_result.searchable_id).pluck(:item_id)
      elsif search_result.searchable_type == 'Location'
        Location.where(id: search_result.searchable_id).pluck(:item_id)
      end
    end

    Item.where(id: item_ids.flatten.compact)
  end
end
