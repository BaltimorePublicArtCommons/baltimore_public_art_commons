When(/^I open the app$/) do
  visit root_path
end

When(/^I want to read more about the app$/) do
  click_link 'Click here to find out more.'
end

Then(/^I should see the about page$/) do
  page.should have_content 'Mission'
end

Given(/^the app has a few items$/) do
  2.times do |index|
    item = Item.create! name: "Test Item #{index}"
    item.images.create! file: 'stock_item_thumbnail_one.jpg'
    item.locations.create! neighborhood: 'Fells Point', current: true
  end
end

Then(/^I should see items$/) do
  page.should have_selector 'div.item img'
end
