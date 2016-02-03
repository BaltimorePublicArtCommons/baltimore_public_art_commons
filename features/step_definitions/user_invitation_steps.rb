When(/^I invite another user$/) do
  click_link 'Invite User'
  fill_in 'Email', with: 'new@user.com'
  click_button 'Invite'
end

When(/^I follow an invite link$/) do
  @user = FactoryGirl.create(:user, :unconfirmed)

  visit edit_user_path(@user, confirmation_hash: @user.confirmation_hash)
end

When(/^I follow a bad invite link$/) do
  user = FactoryGirl.create(:user, :unconfirmed)
  visit edit_user_path(user, confirmation_hash: 'verybad')
end

When(/^I complete registration$/) do
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_button "Submit"
end

Then(/^I should see a message that the user has been invited$/) do
  expect(page).to have_content("Success!")
end
