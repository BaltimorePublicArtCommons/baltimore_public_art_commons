class ItemPublicData
  def initialize(item)
    @item = item
  end

  def id
    @item.id
  end

  def artists
    return ['No Value'] if @item.artists.empty?
    @item.artists.map(&:full_name)
  end

  def artist_et_al
    return 'No Value' if @item.artists.empty?

    name = @item.artists.first.full_name
    name += ', et al.' if @item.artists.size > 1
    name
  end

  def genre
    @item.genre || 'No Value'
  end

  def dimensions
    return 'No Value' if @item.dimensions.empty?
    @item.dimensions
  end

  def installation_date
    date = ''

    if !@item.installation_start_date.value.zero?
      date += @item.installation_start_date.to_s(:long).gsub(',', ' ')

      if !@item.installation_end_date.value.zero?
        date += " - #{@item.installation_end_date.to_s(:long).gsub(',', ' ')}"
      end
    end

    date.blank? ? 'No Value' : date
  end

  def material
    @item.material || 'No Value'
  end

  def neighborhood
    return 'No Value' if @item.locations.current.blank?
    @item.locations.current.neighborhood
  end

  def name(context)
    return 'No Value' if @item.name.blank?

    if context == :index && @item.name.length > 30
      @item.name[0..30] + '...'
    else
      @item.name
    end
  end

  def path(context)
    if context == :show
      if @item.images.any?
        @item.images.first.file.url
      end
    else
      "/items/#{@item.id}"
    end
  end

  def small_image
    return 'not_available.jpg' if !@item.images.any?
    @item.images.first.small.file
  end
end
