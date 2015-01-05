class ArtistsController < ApplicationController
  def index
    @artists = Artist.
      order(last_name: :asc, first_name: :asc).
      paginate(page: params[:page], per_page: 12)

    @artists_public_data = @artists.map { |artist| ArtistPublicData.new(artist) }
  end
end
