module Importers
  class Csv::ModelCreator
    def self.create_model_from_row(model_name: nil, row: nil, unique_attrs: nil)
      self.new.create_model_from_row(model_name, row, unique_attrs)
    end

    def create_model_from_row(model_name, row, unique_attrs)
      attrs = find_model_attrs_in_row(model_name, row)
      return if attrs.empty?

      if unique_attrs
        find_or_create_model(model_name, attrs, unique_attrs)
      else
        model_name_to_constant(model_name).create!(attrs)
      end
    end

    private

    def find_or_create_model(model_name, attrs, unique_attrs)
      model = model_name_to_constant(model_name).find_or_create_by!(
        attrs.select { |k,v| unique_attrs && unique_attrs.include?(k) }
      )

      model.update_attributes!(attrs)
      model
    end

    def find_model_attrs_in_row(model_name, row)
      row.to_h.
        select { |k,v| k =~ /\[#{model_name}\]/ }.
        transform_keys { |k| k.gsub("[#{model_name}]", '') }.
        reject { |k,v| v.nil? }.
        reject { |k,v|
          !model_name_to_constant(model_name).column_names.include?(k)
        }
    end

    def model_name_to_constant(model_name)
      model_name.camelize.constantize
    end
  end
end
