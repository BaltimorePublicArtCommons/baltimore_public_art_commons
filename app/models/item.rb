require 'open-uri'

class Item < ActiveRecord::Base
  has_many :artists
  has_many :images
  has_many :individual_donors
  has_many :locations
  has_many :organizational_donors

  has_one :dimension
  has_one :fabrication

  def self.import_from_open_baltimore!
    endpoint = 'http://data.baltimorecity.gov/resource/5xsg-uc29.json'

    # row count is less than 1000, so we can just grab the whole thing
    open(endpoint) do |j|
      JSON.load(j.read)
    end.each do |i|
      item = Item.new(name: i['titleofartwork'],
                      material: i['medium'])
      item.save!
    end
  end
end
