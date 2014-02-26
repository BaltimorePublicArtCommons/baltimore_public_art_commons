require 'open-uri'

class Item < ActiveRecord::Base
  has_many :artists_items
  has_many :artists, through: :artists_items
  has_many :individual_donors
  has_many :locations
  has_many :organizational_donors

  has_one :dimension
  has_one :fabrication

  has_attached_file :image, styles: { thumb: '100x100>' }
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }

  def self.import_from_open_baltimore!
    image_base_url = 'http://data.baltimorecity.gov/views/5xsg-uc29/files/'
    endpoint = 'http://data.baltimorecity.gov/resource/5xsg-uc29.json'

    # row count is less than 1000, so we can just grab the whole thing
    open(endpoint) do |j|
      JSON.load(j.read)
    end.each do |i|
      item = Item.new(
        name: i['titleofartwork'],
        material: i['medium'],
        installation_date: i['dateofartwork']
      )
      item.save!

      if loc = i['location']
        item.locations.create(longitude: loc['longitude'],
                              latitude: loc['latitude'],
                              current: true)
      end

      if i['artistfirstname'] || i['artistlastname']
        artist = Artist.find_or_create_by(first_name: i['artistfirstname'], last_name: i['artistlastname'])
        item.artists << artist
      end

      if i['image']
        p i['image']
        image_url = image_base_url + i['image']['file_id']
        puts image_url
        extname = File.extname(i['image']['filename'])
        basename = File.basename(i['image']['filename'], extname)
        Tempfile.create([basename, extname]) do |file|
          file.binmode
          open(image_url) do |f|
            file.write f.read
          end
          file.rewind
          item.image = file
          item.save!
        end
      end
    end
  end
end
