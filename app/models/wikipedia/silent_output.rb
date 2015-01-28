module Wikipedia

  #
  #  Silent output
  #
  #  no output at all -- good for tests
  #
  class SilentOutput

    def go_fish(artist, name = nil)
    end

    def print_bio(bio, artist, name = nil)
    end

    def disambiguation(wiki_url, artist, name = nil)
    end

    def bail(e, artist, name = nil)
    end

    def finish
    end
  end
end
