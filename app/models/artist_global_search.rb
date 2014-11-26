class ArtistGlobalSearch
  def initialize(query)
    @query = query
  end

  def artists
    search_results = PgSearch.multisearch(@query)

    artist_ids = search_results.map do |search_result|
      if search_result.searchable_type == 'Artist'
        search_result.searchable_id
      elsif search_result.searchable_type == 'Item'
        ItemArtist.where(item_id: search_result.searchable_id).pluck(:artist_id)
      end
    end

    Artist.where(id: artist_ids.flatten.compact).order(last_name: :asc)
  end
end

