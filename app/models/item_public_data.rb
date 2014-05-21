class ItemPublicData
  def initialize(item)
    @item = item
  end

  def artists
    return ['No Value'] if @item.artists.empty?
    @item.artists.map do |artist|
      "#{artist.first_name} #{artist.last_name}"
    end
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
    date += @item.installation_start_date.to_s if @item.installation_start_date
    date += " - #{@item.installation_end_date}" if @item.installation_end_date
    date.blank? ? 'No Value' : date
  end

  def material
    @item.material || 'No Value'
  end

  def neighborhood
    return 'No Value' if @item.locations.current.blank?
    @item.locations.current.neighborhood
  end

  def name
    @item.name || 'No Value'
  end

  def path
    "/items/#{@item.id}"
  end

  def to_partial_path
    'items/item_public_data'
  end

  def small_image
    return 'not_available.jpg' if !@item.images.any?
    @item.images.first.small.file
  end
end
