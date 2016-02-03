When(/^I invite another user$/) do
  click_link 'Invite User'
  fill_in 'Email', with: 'new@user.com'
  click_button 'Invite'
end

Then(/^I should see a message that the user has been invited$/) do
  expect(page).to have_content("Success!")
end
