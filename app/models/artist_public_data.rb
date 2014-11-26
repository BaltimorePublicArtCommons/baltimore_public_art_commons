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
    end
  end

  def small_image
    return 'not_available.jpg' if !@artist.image.present?
    @artist.image.small.file
  end
end
