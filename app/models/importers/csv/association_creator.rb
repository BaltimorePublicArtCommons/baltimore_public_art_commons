module Importers
  class Csv::AssociationCreator
    ASSOCIATIONS = [
      Csv::Association.new(
        name: 'artists',
        unique_attrs: ['first_name', 'last_name']
      ),
      Csv::Association.new(name: 'locations'),
      Csv::Association.new(
        name: 'organizational_donors',
        unique_attrs: ['name']
      ),
      Csv::Association.new(
        name: 'individual_donors',
        unique_attrs: ['first_name', 'last_name']
      ),
      Csv::Association.new(name: 'fabrication')
    ]

    def self.create_item_associations_from_row(item, row)
      self.new.create_item_associations_from_row(item, row)
    end

    def create_item_associations_from_row(item, row)
      ASSOCIATIONS.each do |association|
        create_item_association_from_row(association, item, row)
      end
    end

    def create_item_association_from_row(association, item, row)
      new_model = Csv::ModelCreator.create_model_from_row(
        model_name: association.model_name,
        unique_attrs: association.unique_attrs,
        row: row
      )

      associate_new_model_with_item(new_model, association, item) if new_model
    end

    def associate_new_model_with_item(new_model, association, item)
      if association.is_has_many_for_item?(item)
        if !item.send(association.name).pluck(:id).include?(new_model.id)
          item.send(association.name) << new_model
        end
      else
        new_model.update_attributes(item_id: item.id)
      end
    end
  end
end
