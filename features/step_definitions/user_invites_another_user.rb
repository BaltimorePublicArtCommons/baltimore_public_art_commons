Then (/^I fill out the user invite form$/) do
  fill_in 'Email', with: 'new@user.com'
  select 'curator', from: 'Role'
  click_button 'Invite'
end
