class ArtistPublicData
  def initialize(artist)
    @artist = artist
  end

  def name(context)
    name = "#{@artist.first_name} #{@artist.last_name}".strip if @artist.first_name
    name ||= @artist.last_name || "Anonymous"

    if context == :index && name.length > 30
      name[0..30] + '...'
    else
      name
    end
  end

  def path(context)
    if context == :show
      if @artist.image.present?
        @artist.image.file.url
      end
    else
      "/artists/#{@artist.id}"
    end
  end

  def bio
    missing_bio = "Baltimore Public Art Commons is sourcing"          <<
      " biographical information about artists from Wikipedia, but"   <<
      " #{name(:show)} does not have an entry. If you would like to"  <<
      " contribute, please create an entry."

    @artist.bio || missing_bio
  end

  def bio_source
    @artist.bio_source
  end

  def small_image
    return 'not_available.jpg' if !@artist.image.present?
    @artist.image.small.file
  end
end
