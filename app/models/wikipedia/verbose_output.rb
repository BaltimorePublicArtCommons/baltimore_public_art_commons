module Wikipedia
  #
  #  Verbose output
  #
  #    Prints a bunch of information to the screen as artists are processed
  #
  class VerboseOutput

    def go_fish(artist, name = nil)
      name ||= wiki_name(artist)
      looking_for artist, name
      printf "go fish...\n".light_red
    end

    def print_bio(bio, artist, name = nil)
      name ||= wiki_name(artist)
      found_it artist, name
      printf bio.light_blue
      printf "\n\n"
    end

    def disambiguation(wiki_url, artist, name = nil)
      name ||= wiki_name(artist)
      looking_for artist, name
      printf "    ---> diambiguation at #{wiki_url} for #{name}\n".bold.magenta
    end

    def bail(e, artist, name = nil)
      name ||= wiki_name(artist)
      looking_for artist, name
      printf "big problems: BAIL!\n".bold.white.on_red
      p e
    end

    def finish
      printf "--------------------------------------------------------------------------------\n"
    end

    private

    def looking_for(artist, name = nil)
      name ||= wiki_name(artist)
      printf "looking for bio on #{"#{artist.first_name} #{artist.last_name}"} (#{name})...".light_black
    end

    def found_it(artist, name = nil)
      name ||= wiki_name(artist)
      looking_for artist, name
      printf "FOUND IT!\n".light_green
    end
  end
end
