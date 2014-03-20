if Rails.env.development?
  images = [
    'app/assets/images/stock_item_one',
    'app/assets/images/stock_item_two',
    'app/assets/images/stock_item_three'
  ]

  artists = [
    Artist.create!(first_name: 'John', last_name: 'Waters'),
    Artist.create!(first_name: 'Johns', last_name: 'Hopkins'),
    Artist.create!(first_name: 'Johnny', last_name: 'Unitas'),
    Artist.create!(first_name: 'John', last_name: 'Doe')
  ]

  neighborhoods = ['Fells Point', 'Mount Vernon', 'Station North']

  15.times do |index|
    item = Item.create! name: "Fake Item #{index + 1}"

    item.locations.create! neighborhood: neighborhoods.sample, current: true

    image_name = images.sample
    image = item.images.create! file: File.open(image_name + '.jpg')
    image.image_versions.create! version: 'small',
      file: File.open(image_name + '_small.jpg')

    r = Random.new

    if r.rand > 0.5
      item.artists << artists.sample(2)
    else
      item.artists << artists.sample
    end
  end
end
