When(/^I open the app$/) do
  visit root_path
end

Then(/^I should see the home page$/) do
  page.should have_content 'Baltimore Public Art Commons is'
end

When(/^I want to read more about the app$/) do
  click_link 'Read More'
end

Then(/^I should see the about page$/) do
  page.should have_content 'Mission'
end

When(/^I want to see items$/) do
  click_link 'Browse the Collection'
end

Then(/^I should see items$/) do
  pending 'Add items view'
end
