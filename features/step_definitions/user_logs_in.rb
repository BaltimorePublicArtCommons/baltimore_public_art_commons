Given(/^that a user exists$/) do
  User.create!(email: 'foo@bar.com', password: 'foobar', password_confirmation: 'foobar')
end

When(/^I go to \/login$/) do
  visit('/login')
end

When(/^fill out the fields$/) do
  fill_in('Email', with: 'foo@bar.com')
  fill_in('Password', with: 'foobar')
end

When(/^I submit the form$/) do
  click_button('Login')
end

Then(/^I should be redirected to the homepage$/) do
  expect(current_path).to eq(root_path)
end
