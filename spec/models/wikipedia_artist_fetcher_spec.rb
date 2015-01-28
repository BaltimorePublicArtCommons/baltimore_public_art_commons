require 'spec_helper'

describe Wikipedia::WikipediaArtistFetcher do
  context '.fetch', vcr: true do
    before do
      @artist_not_on_wikipedia = Artist.create! first_name: "Doug", last_name: "Price"
      @artist_on_wikipedia = Artist.create! first_name: "Albert", last_name: "Einstein"
      @artist_ambiguous_on_wikipedia = Artist.create! first_name: "John", last_name: "Smith"

      @fetcher = Wikipedia::WikipediaArtistFetcher.new("silent")
      @fetcher.fetch
    end

    it 'should find that some artists are ambiguous' do
      @fetcher.ambiguous_count.should == 1
    end
    it 'should find that some artists are not found' do
      @fetcher.not_found_count.should == 1
    end
    it 'should find that some artists are found' do
      @fetcher.found_count.should == 1
    end

    context 'updating artists' do
      it 'artists found will have bio updated' do
        expect(@artist_on_wikipedia.reload.bio).to(be_present)
      end
      it 'artists with ambiguous names are not updated' do
        expect(@artist_ambiguous_on_wikipedia.reload.bio).to_not(be_present)
      end
      it 'artists not found are not updated' do
        expect(@artist_not_on_wikipedia.reload.bio).to_not(be_present)
      end
    end
  end
end
