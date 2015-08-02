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

Then(/^I should be redirected to the admin dashboard$/) do
  expect(current_path).to eq(admin_path)
end

Then(/^I should see an alert on the login page$/) do
  expect(page).to have_content('invalid')
end

When(/^I go to the admin dashboard without logging in$/) do
  visit admin_path
end

Then(/^I should be redirected to the login page$/) do
  expect(current_path).to eq(new_session_path)
end
