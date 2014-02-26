When(/^I want to see more information about the first item$/) do
  click_link 'Test Item 1'
end

Then(/^I should see information about that item$/) do
  page.should have_content 'Fells Point'
end
