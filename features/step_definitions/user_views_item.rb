When(/^I want to see more information about the first item$/) do
  click_link 'Test Item 0'
end

Then(/^I should see information about the first item$/) do
  page.should have_content 'Test Item 0'
end
