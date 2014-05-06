class PartialDateLoader
  def self.load(model, date_attribute)
    date = model.read_attribute(date_attribute) || 0
    PartialDate::Date.load(date)
  end
end
