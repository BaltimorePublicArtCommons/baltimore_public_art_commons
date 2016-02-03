When(/^I login$/) do
  @user = User.create!(
    email: 'test@user.com',
    first_name: 'Hans',
    password: 'password',
    password_confirmation: 'password'
  )

  visit login_path
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Login'
end

When(/^I login with bad credentials$/) do
  visit login_path
  fill_in 'Email', with: 'something@bogus.com'
  fill_in 'Password', with: 'neverGonnaWork'
  click_button 'Login'
end

Then(/^I should be logged in$/) do
  expect(page).to have_content("Logged in as #{@user.first_name}")
end

Then(/^I should not be logged in$/) do
  expect(page).to have_no_content('Logged in as')
end

Then(/^I should see an alert on the login page$/) do
  expect(page).to have_content('invalid')
end
