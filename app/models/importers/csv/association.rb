module Importers
  class Csv::Association
    attr_accessor :name, :unique_attrs

    def initialize(name: nil, unique_attrs: nil)
      @name = name
      @unique_attrs = unique_attrs
    end

    def model_name
      @name.singularize
    end

    def is_has_many_for_item?(item)
      item.send(@name).respond_to?('create!')
    end
  end
end
