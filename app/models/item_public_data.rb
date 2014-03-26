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

  def description
    @item.description || 'No Value'
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

  def path
    "/items/#{@item.id}"
  end

  def to_partial_path
    'items/item_public_data'
  end

  def small_image
    return 'not_available.jpg' if !@item.images.any?
    @item.images.first.file.small.url
  end

  private

  def item_has_dimensions?
    return false if @item.dimension.blank?
    @item.dimension.height || @item.dimension.width || @item.dimension.depth
  end
end
