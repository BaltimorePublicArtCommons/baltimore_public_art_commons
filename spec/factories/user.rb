# Read about Factories at https://github.com/thoughtbot/factory_girl

require 'random_hash'

FactoryGirl.define do
  factory :admin, class: User do
    first_name "Cat"
    last_name "Power"
    email "cat@power.com"
    password "password"
    password_confirmation "password"
    role :admin
    confirmation_hash RandomHash.generate
  end

  factory :user do
    first_name "Cat"
    last_name "Power"
    email "cat@power.com"
    password "password"
    password_confirmation "password"
    confirmation_hash RandomHash.generate

    trait :unconfirmed do
      confirmed false
    end
  end
end
