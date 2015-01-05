Given(/^there is an item named "(.*?)" by "(.*?)" in "(.*?)"$/) do |name, artist, neighborhood|
  item = Item.create! name: name

  artist_first_name, artist_last_name = artist.split(' ')
  item.artists.create! first_name: artist_first_name,
    last_name: artist_last_name

  item.locations.create! neighborhood: neighborhood

  item.images.create!
end

When(/^I search for "(.*?)"$/) do |query|
  fill_in 'Search the Collection...', with: query
  click_button ''
end

Then(/^I should see (\d+) items? that matche?s? name "(.*?)"$/) do |number_of_items, query|
  expect(page).to(
    have_selector('.tile a[href*="items"]', text: query, count: number_of_items)
  )
end

Then(/^I should see (\d+) items? that matche?s? neighborhood "(.*?)"$/) do |number_of_items, query|
  expect(page).to(
    have_selector('.tile a[href*="items"]', count: number_of_items)
  )

  item_ids = Location.where(neighborhood: query).pluck(:id)
  item_names = Item.where(id: item_ids).pluck(:name)

  item_names.each do |item_name|
    expect(page).to have_content(item_name)
  end
end

Then(/^I should see (\d+) items? that matche?s? artist "(.*?)"$/) do |number_of_items, query|
  expect(page).to(
    have_selector('.tile a[href*="items"]', count: number_of_items)
  )

  artist_first_name, artist_last_name = query.split(' ')

  artist_ids = Artist.
    where(first_name: artist_first_name, last_name: artist_last_name).
    pluck(:id)

  item_ids = ItemArtist.where(artist_id: artist_ids).pluck(:item_id)

  item_names = Item.where(id: item_ids).pluck(:name)

  item_names.each do |item_name|
    expect(page).to have_content(item_name)
  end
end
