Given(/^there are a few items$/) do
  @items = [
    create_item!(neighborhood: 'Fells Point', artist_name: 'Jane Artist'),
    create_item!(neighborhood: 'Mount Vernon', artist_name: 'John Artist'),
    create_item!(neighborhood: 'Fells Point', artist_name: 'Jane Artist')
  ]
end

Given(/^there are many items$/) do
  @items = 20.times.map do |index|
    create(:item)
  end
end

When(/^I go to the items page$/) do
  visit root_path
end

When(/^I want to see more information about an item$/) do
  @item = @items.sample
  click_link @item.name
end

When(/^I want to see more items$/) do
  click_link 'Next'
end

Then(/^I should see information about that item$/) do
  expect(page).to have_content(@item.genre)
end

Then(/^I should see the next page of items$/) do
  # The items page currently shows 12 items per page, so an item on the next
  # page would be after @items[11]
  next_page_item = @items[12]

  expect(page).to have_link(next_page_item.name)
end

Then(/^I should see items "(.*?)"$/) do |item_names|
  item_names.split(',').each do |item_name|
    expect(page).to have_link(item_name.strip)
  end
end

Then(/^I should not see items "(.*?)"$/) do |item_names|
  item_names.split(',').each do |item_name|
    expect(page).to have_no_link(item_name.strip)
  end
end

def create_item!(neighborhood: 'Station North', artist_name: 'Kanye West')
  item = create(:item)
  item.locations.create!(neighborhood: neighborhood)
  item.artists << create_artist!(name: artist_name)
  item
end

def create_artist!(name: 'Kanye West')
  first_name, last_name = name.split(' ')
  Artist.create!(first_name: first_name, last_name: last_name)
end
