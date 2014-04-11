
require 'csv'

module Importers
  module ThisOneFirst
    module_function
    def import_from_assets
      import_file!(File.expand_path('../../../vendor/assets/data/This%20One%20First%20-%20Sheet1.csv', __FILE__))
    end
    
    def import_file!(path)
      File.open(path) do |f|
        import!(f.read)
      end
    end

    def import!(data)
      CSV.parse(data) do |row|
        next if !row.first || row.first == 'Area'
        csv_to_item(row)
      end
    end

    # fields =>
    # area, cat no, title, height, width, depth, material, artist 1 (last), a1 (first), a1 (birth-death), a1 (title),
    #   a2 (last), a2 (first), a2 (birth-death), a2 (title), date, installation date, fab date, fab studio, location
    #   prev locations, long, lat, coords, donors (last), donors (first), copyr status
    def csv_to_item(row)
      title = title_for_row(row)
      material = material_for_row(row)
      date     = installation_date_for_row(row)
      artists = artists_for_row(row)
      locations = locations_for_row(row)

      item = Item.create!(name: title, material: material, installation_date: date)
      artists.each { |a| item.artists << a }
      locations.each { |l| item.locations << l }
    end

    def title_for_row(row)
      return unless row
      return unless row[2] || row[1]
      row[2] || "Number: #{row[1].strip}"
    end

    def material_for_row(row); row[6] end

    def installation_date_for_row(row); row[16] || row[15] end
    
    def artists_for_row(row)
      [row[7, 4], row[11, 4]].map { |d| artist_for_data(*d) }.compact
    end

    def artist_for_data(last, first, birth_to_death, title)
      return unless last || first
      Artist.find_or_create_by(first_name: first, last_name: last) do |artist|
        ??
      end
    end

    def locations_for_row(row)
      longitude = row[21]
      latitude  = row[22]
      return [] unless latitude && longitude
      [Location.new(longitude: longitude, latitude: latitude, current: true)]
    end
  end
end
