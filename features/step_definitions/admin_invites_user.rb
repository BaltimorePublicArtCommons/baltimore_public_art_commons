Given(/^there is a user with admin "(.*?)", email "(.*?)", password "(.*?)", first_name "(.*?)"$/) do |admin, email, password, name|
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               first_name: name,
               admin: true)
end

Given(/^log in with email "(.*?)" and password "(.*?)"$/) do |email, password|
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  click_button('Login')
end

When(/^I navigate to \/invite$/) do
  click_link 'Invite'
  expect(page).to have_content('Email')
end

Then(/^I should send an email to an invitee at "(.*?)"$/) do |invitee_email|
  fill_in('Email', with: invitee_email)
  click_button('Send')
end