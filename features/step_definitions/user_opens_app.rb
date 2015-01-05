Given(/^the app has a few items$/) do
  2.times do |index|
    item = Item.create! name: "Test Item #{index}"
    item.images.create!
  end
end

Given(/^the app has many items$/) do
  20.times do |index|
    item = Item.create! name: "Test Item #{index}"
    item.images.create!
  end
end

When(/^I open the app$/) do
  visit root_path
end

Then(/^I should see that more pages are available$/) do
  page.should have_content 'Next'
end

Then(/^I should only see (\d+) items on the page$/) do |count|
  expect(page).to have_selector('.tile a[href*="items"]', count: count)
end

Then(/^I should see (\d+) or fewer items on the page$/) do |count|
  expect(page).to have_selector('.tile a[href*="items"]', maximum: count)
end

When(/^I want to see more content$/) do
  click_link 'Next'
end

Then(/^I should see the second page of content$/) do
  expect(page).to have_selector('.pagination .current', text: '2')
end

When(/^I want to read more about the app$/) do
  click_link 'About Us'
end

Then(/^I should see the about page$/) do
  page.should have_content 'Mission'
end
