require 'importers'
require 'open-uri'

module Importers
  module OpenBaltimore
    IMAGE_BASE_URL = 'http://data.baltimorecity.gov/views/5xsg-uc29/files/'
    ENDPOINT = 'http://data.baltimorecity.gov/resource/5xsg-uc29.json'

    extend Common
    module_function

    def import!
      open(ENDPOINT) { |j| JSON.load(j.read) }.map { |j| json_to_item(j) }
    end

    def json_to_item(json)
      item = Item.new(
        name: json['titleofartwork'],
        material: json['medium'],
        installation_date: json['dateofartwork']
      )
      item.save!
      maybe_import_location(item, json)
      maybe_import_artist(item, json)
      maybe_import_image(item, json)

      item
    end

    def maybe_import_location(item, json)
      return unless json['location']
      item.locations.create(longitude: json['location']['longitude'],
                            latitude: json['location']['latitude'],
                            current: true)
    end

    def maybe_import_artist(item, json)
      return unless json['artistfirstname'] || json['artistlastname']
      artist = Artist.find_or_create_by(first_name: json['artistfirstname'],
                                        last_name: json['artistlastname'])
      item.artists << artist
    end

    def maybe_import_image(item, json)
      return unless json['image']
      image_url = IMAGE_BASE_URL + json['image']['file_id']
      download_file(json['image']['filename'], image_url) do |file|
        item.image = file
        item.save!
      end
    end
  end
end
