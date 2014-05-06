module Importers
  class Csv::ImageCreator
    def self.create_item_images_from_row(item, row, image_file_path)
      return if image_file_path.nil?
      self.new.create_item_images_from_row(item, row, image_file_path)
    end

    def create_item_images_from_row(item, row, image_file_path)
      image = create_item_image_from_row(item, row, image_file_path)
      create_image_version(image, row, image_file_path)
    end

    private

    def create_item_image_from_row(item, row, image_file_path)
      attrs = find_model_attrs_in_row('image', row)
      return if attrs_are_blank?(attrs)

      attrs['file'] = File.open("#{image_file_path}/#{attrs['file']}")
      item.images.create!(attrs)
    end

    def create_image_version(image, row, image_file_path)
      attrs = find_model_attrs_in_row('image_version', row)
      return if attrs_are_blank?(attrs)

      attrs['file'] = File.open("#{image_file_path}/#{attrs['file']}")
      image.image_versions.create!(attrs)
    end

    def attrs_are_blank?(attrs)
      attrs.all? { |k,v| v.nil? }
    end

    def find_model_attrs_in_row(model_name, row)
      row.to_h.
        select { |k,v| k =~ /\[#{model_name}\]/ }.
        transform_keys { |k| k.gsub("[#{model_name}]", '') }
    end
  end
end
