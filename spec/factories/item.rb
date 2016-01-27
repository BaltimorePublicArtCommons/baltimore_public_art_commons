FactoryGirl.define do
  factory :item do
    sequence(:name) { |n| "Test Item #{n}" }
    genre 'mural'
  end
end
