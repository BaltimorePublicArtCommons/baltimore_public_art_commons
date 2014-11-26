class ArtistsController < ApplicationController
  def index
    if params[:query].present?
      search_response
    else
      index_response
    end
  end

  private

  def index_response
    @artists = Artist.all.order(last_name: :asc, first_name: :asc).
                          paginate(page: params[:page], per_page: 12)
    @artists_public_data = @artists.map { |artist| ArtistPublicData.new(artist) }
  end

  def search_response
    @artists = ArtistGlobalSearch.new(params[:query]).artists.paginate(page: params[:page],
                                                                 per_page: 12)
    @artists_public_data = @artists.map { |artist| ArtistPublicData.new(artist) }
    @query_header = query_header_for_query(params[:query], @artists.present?)
  end
end
