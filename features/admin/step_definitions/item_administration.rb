Then(/^I should see a list of items$/) do
  expect(page).to have_selector('.item', minimum: 12)
end
