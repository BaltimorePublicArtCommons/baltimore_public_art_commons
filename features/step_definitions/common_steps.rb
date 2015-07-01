Given(/^I am logged in as an "(.*?)" user$/) do |user|
  @user = FactoryGirl.create :"#{user}"
  visit('/login')
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: "password"
  click_button 'Login'
  expect(page).to have_content('Invite User')
end

When(/^I click the "(.*?)" link$/) do |arg1|
  click_link arg1
end

Then(/^I should see a success message$/) do
  expect(page).to have_content("Success!")
end
