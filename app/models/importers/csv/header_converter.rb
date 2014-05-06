module Importers
  class Csv::HeaderConverter
    def self.define_header_converter(csv_file_path)
      self.new.define_header_converter(csv_file_path)
    end

    def define_header_converter(csv_file_path)
      first_row_headers = find_first_row_headers(csv_file_path)

      lambda do |column_name, column_info|
        "[#{first_row_headers[column_info.index]}]#{column_name}".
          gsub(' ', '').
          underscore
      end
    end

    private

    def find_first_row_headers(csv_file_path)
      first_row_headers = []

      csv_file = File.new(csv_file_path, 'r')
      first_row = csv_file.gets

      CSV.parse(first_row) do |row|
        current_header = nil

        row.each_with_index do |column_name, index|
          current_header = column_name if column_name.present?
          first_row_headers << current_header
        end
      end

      csv_file.close
      first_row_headers
    end
  end
end
