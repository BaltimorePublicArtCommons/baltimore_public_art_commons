module Wikipedia
  #
  #  Short output (default)
  #
  #  . : successful acquisition
  #  X : artist not found
  #  ? : wikipedia disambiguation page found
  #  ! : exception thrown
  #
  class ShortOutput

    def go_fish(artist, name = nil)
      name ||= wiki_name(artist)
      printf 'X'.light_red
    end

    def print_bio(bio, artist, name = nil)
      name ||= wiki_name(artist)
      printf "."
    end

    def disambiguation(wiki_url, artist, name = nil)
      name ||= wiki_name(artist)
      printf "?".bold.magenta
    end

    def bail(e, artist, name = nil)
      name ||= wiki_name(artist)
      printf "!".bold.white.on_red
    end

    def finish
      printf "\n"
    end
  end

end
