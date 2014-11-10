Given(/^there is a user with email "(.*?)", password "(.*?)" and first_name "(.*?)"$/) do |email, password, name|
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               first_name: name)
end

When(/^I login as "(.*?)" with password "(.*?)"$/) do |user_email, password|
  fill_in('Email', with: user_email)
  fill_in('Password', with: password)
  click_button('Login')
end

When(/^I go to \/login$/) do
  visit('/login')
end

Then(/^I should be redirected to the homepage$/) do
  expect(current_path).to eq(root_path)
end

Then(/^I should see an alert on the login page$/) do
  expect(page).to have_content('invalid')
end

Then(/^see my first_name "(.*?)" in the secodary header$/) do |name|
  expect(page).to have_content('Logged in as ' + name)
end

When(/^I go to the homepage without logging in$/) do
  visit('items')
end

Then(/^should not see the first_name "(.*?)" in the secondary header$/)  do |name|
  expect(page).to_not have_content('Logged in as ' + name)
end
