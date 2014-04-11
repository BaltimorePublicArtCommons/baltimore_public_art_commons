require 'open-uri'

module Importers
  module Common
    module_function

    def download_file(filename, url)
      extname = File.extname(filename)
      basename = File.basename(filename, extname)
      Tempfile.create([basename, extname]) do |file|
        file.binmode
        open(url) { |f| file.write f.read }
        file.rewind
        yield file
      end
    end
  end
end
