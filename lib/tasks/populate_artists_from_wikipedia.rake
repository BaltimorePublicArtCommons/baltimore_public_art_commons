require 'addressable/uri'
namespace :bpac do

  desc "attempt to scrape the artists' bio from wikipedia -- valid styles are short (default) and verbose."
  task :populate_artists_from_wikipedia, [:output_style] => :environment do |t, args|
    output_style = args[:output_style]
    fetcher = Wikipedia::WikipediaArtistFetcher.new output_style
    fetcher.fetch
  end

end
