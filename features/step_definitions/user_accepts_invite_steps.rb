Given(/^I am an unconfirmed user$/) do
  @user = FactoryGirl.create :user, :unconfirmed
end

When(/^I navigate to the confirmation page$/) do
  visit edit_user_path(@user, confirmation_hash: @user.confirmation_hash)
end

When(/^I navigate to the confirmation page without a confirmation hash$/) do
  visit edit_user_path @user
end

When(/^I set my password$/) do
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_button "Submit"
end

Then(/^I should see an error message$/) do
  expect(page).to have_content "It looks like you're lost"
end
