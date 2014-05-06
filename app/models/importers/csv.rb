require 'csv'

module Importers
  class Csv
    def self.import(csv_file_path, image_file_path = nil)
      self.new.import(csv_file_path, image_file_path)
    end

    def import(csv_file_path, image_file_path)
      CSV::HeaderConverters[:multi_row_header] =
        Csv::HeaderConverter.define_header_converter(csv_file_path)

      skip_first_header_regex = /.*Item,,/

      CSV.foreach(
        csv_file_path,
        skip_lines: skip_first_header_regex,
        headers: true,
        header_converters: :multi_row_header
      ) do |row|

        item = Csv::ModelCreator.create_model_from_row(
          model_name: 'item',
          unique_attrs: 'name',
          row: row
        )

        Csv::AssociationCreator.
          create_item_associations_from_row(item, row)

        Csv::ImageCreator.
          create_item_images_from_row(item, row, image_file_path)
      end
    end
  end
end
