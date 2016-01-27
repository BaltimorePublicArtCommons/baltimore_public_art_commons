Given(/^the app has a few artists$/) do
  @artists = 3.times.map do |index|
    Artist.create!(first_name: "#{index + 1}", last_name: "Artist")
  end
end

Given(/^the app has many artists$/) do
  @artists = 20.times.map do |index|
    Artist.create!(first_name: "#{100 + index}", last_name: "Artist")
  end
end

When(/^I go to the artists page$/) do
  visit root_path
  click_link 'Artists'
end

When(/^I want to see more artists$/) do
  click_link 'Next'
end

When(/^I want to see more information about an artist$/) do
  @artist = @artists.sample
  @artist_presenter = ArtistPublicData.new(@artist)
  click_link @artist_presenter.name(nil)
end

Then(/^I should see information about the artist$/) do
  expect(page).to have_content(@artist_presenter.bio)
end

Then(/^I should see the next page of artists$/) do
  # The artists page currently shows 12 items per page, so an artist on the next
  # page would be after @artists[11]
  next_page_artist = @artists[12]
  next_page_artist_presenter = ArtistPublicData.new(next_page_artist)

  expect(page).to have_link(next_page_artist_presenter.name(nil))
end
