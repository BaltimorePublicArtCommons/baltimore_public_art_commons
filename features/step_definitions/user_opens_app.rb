Given(/^the app has a few items$/) do
  2.times do |index|
    item = Item.create! name: "Test Item #{index}"
    item.images.create!
  end
end

When(/^I open the app$/) do
  visit root_path
end

When(/^I want to read more about the app$/) do
  click_link 'About Us'
end

Then(/^I should see the about page$/) do
  page.should have_content 'Mission'
end

Then(/^I should see items$/) do
  page.should have_selector 'div.item img', count: 2
end
