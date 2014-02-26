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

  def dimensions
    return 'No Value' if !item_has_dimensions?
    [@item.dimension.height, @item.dimension.width, @item.dimension.depth].
    compact.
    join(' x ')
  end

  def installation_date
    @item.installation_date || 'No Value'
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

  def thumbnail_image
    @item.image.url(:thumb)
  end

  def full_image
    @item.image.url
  end

  private

  def item_has_dimensions?
    return false if @item.dimension.blank?
    @item.dimension.height || @item.dimension.width || @item.dimension.depth
  end
end