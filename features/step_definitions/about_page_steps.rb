When(/^I go to the about page$/) do
  visit root_path
  click_link 'About Us'
end

Then(/^I should see the about page$/) do
  expect(page).to have_content('Mission')
end
