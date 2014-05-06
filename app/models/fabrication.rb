class Fabrication < ActiveRecord::Base
  def date
    PartialDateLoader.load(self, :date)
  end
end
