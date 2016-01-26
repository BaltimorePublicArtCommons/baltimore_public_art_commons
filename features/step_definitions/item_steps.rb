Given(/^the app has a few items$/) do
  @items = 3.times.map do |index|
    item = Item.create! name: "Test Item #{index + 1}", genre: 'mural'
    item
  end
end

Given(/^the app has many items$/) do
  @items = 20.times.map do |index|
    item = Item.create! name: "Test Item #{index + 1}"
    item
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
