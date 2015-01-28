module Wikipedia
  class WikipediaArtistFetcher
    attr_accessor :found_count, :not_found_count, :ambiguous_count 

    def initialize(output_style = "short")
      @style = output_style
      self.found_count     = 0
      self.not_found_count = 0
      self.ambiguous_count = 0
    end

    def fetch
      writer = build_output @style
      Artist.all.order(:last_name).each do |a|
        name = wiki_name a
        wiki_url = Addressable::URI.parse(source(a)).normalize.to_str
        begin
          wiki_page = RestClient.get(wiki_url) { |response, request, result, &block|
            case response.code
            when 200
              response
            else
              @not_found_count += 1
              writer.go_fish a, name
              nil
            end
          }
        rescue => e
          writer.bail(e, a, name)
        end
        if wiki_page
          if disambiguation_regex.match(wiki_page)
            @ambiguous_count += 1
            writer.disambiguation wiki_url, a, name
            next
          end
          @found_count += 1
          bio = parse_bio wiki_page
          writer.print_bio bio, a, name
          a.update_attributes bio: bio, bio_source: wiki_url
        end
      end
      writer.finish
    end

    def source(artist)
      if artist.bio_source.present?
        artist.bio_source
      else
        wiki_base_url + wiki_name(artist)
      end
    end

    def parse_bio(page)
      page = paragraph_regex.match(page)[1] # grab the first paragraph
      page.gsub!(/<[^>]*>/, "") # remove all html markup
      page.gsub!(/\[[^\]]\]/, "") # remove bracketed footnotes
      page # need to return page since gsub! may return nil
    end

    def wiki_base_url
      'http://en.wikipedia.org/wiki/'
    end

    def paragraph_regex
      %r[<p>(.*)</p>]
    end

    def disambiguation_regex
      %r[<a href="/wiki/Help:Disambiguation" title="Help:Disambiguation">disambiguation</a>]
    end

    #
    # Attempts to convert the artist name to the format used by Wikipedia
    #
    def wiki_name(artist)
      name = "#{artist.first_name} #{artist.last_name}"
      name.split.each { |x| x.gsub!(/[.']/, ""); x.capitalize! }.join("_")
    end

    #=============================================================================
    #
    #  Output factory
    #
    #  Currently two styles, Short (default) and Verbose
    #
    def build_output(style)
      output_styles = {
        "short"   => Wikipedia::ShortOutput,
        "verbose" => Wikipedia::VerboseOutput,
        "silent"  => Wikipedia::SilentOutput
      }

      if ! output_styles.keys.include?(style)
        printf "\nUnknown output style '#{style}', using default\n\n" unless style.blank?
        style = "short"
      end
      output_styles[style].new
    end

  end
end
