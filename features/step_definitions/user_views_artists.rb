Given(/^the app has a few artists$/) do
  3.times do |index|
    artist = Artist.create! first_name: "Test_#{index}", last_name: "Artist"
    artist.create_image!
  end
end

When(/^I want to see a listing of the artists$/) do
  click_link 'Artists'
end

Then(/^I should see (\d+) or fewer artists$/) do |count|
  expect(page).to have_selector('.tile a[href*="artists"]', maximum: count)
end

When(/^I visit the artists page$/) do
  visit "/artists"
end

When(/^I want to see more information about the first artist$/) do
  click_link 'Test_0 Artist'
end

Then(/^I should see information about the first artist$/) do
  page.should have_content 'Test_0 Artist'
end
