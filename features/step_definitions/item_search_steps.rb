When(/^I search for an item by name$/) do
  step "I search for items with \"#{@items.first.name}\""
end

When(/^I search for items by neighborhood$/) do
  search_term = @items.first.locations.first.neighborhood
  step "I search for items with \"#{search_term}\""
end

When(/^I search for items by artist name$/) do
  search_term = ArtistPublicData.new(@items[1].artists.first).name(nil)
  step "I search for items with \"#{search_term}\""
end

When(/^I search for items with "(.*?)"$/) do |item_search_term|
  @item_search_term = item_search_term
  visit root_path
  fill_in 'Search the Collection...', with: @item_search_term
  click_button 'Search'
end

Then(/^I should only see items with that name$/) do
  search_items, non_search_items = @items.partition do |item|
    item.name == @item_search_term
  end

  step "I should see items \"#{search_items.map(&:name).join(', ')}\""
  step "I should not see items \"#{non_search_items.map(&:name).join(', ')}\""
end

Then(/^I should only see items in that neighborhood$/) do
  search_items, non_search_items = @items.partition do |item|
    item.locations.first.neighborhood == @item_search_term
  end

  step "I should see items \"#{search_items.map(&:name).join(', ')}\""
  step "I should not see items \"#{non_search_items.map(&:name).join(', ')}\""
end

Then(/^I should only see items by that artist$/) do
  search_items, non_search_items = @items.partition do |item|
    item_artist_presenter = ArtistPublicData.new(item.artists.first)
    item_artist_presenter.name(nil) == @item_search_term
  end

  step "I should see items \"#{search_items.map(&:name).join(', ')}\""
  step "I should not see items \"#{non_search_items.map(&:name).join(', ')}\""
end

Then(/^I should see that there are no items found$/) do
  expect(page).to have_content('No search results')
end
