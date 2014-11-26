Given(/^the app has a few artists$/) do
  3.times do |index|
    artist = Artist.create! first_name: "Test_#{index}", last_name: "Artist"
    artist.create_image!
  end
end

When(/^I want to see a listing of the artists$/) do
  click_link 'Artists'
end

Then(/^I should see artists$/) do
  page.should have_content 'Artists'
  page.should have_selector 'div.artist img', count: 3
end
