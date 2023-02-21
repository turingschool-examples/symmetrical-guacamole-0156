FactoryBot.define do
  factory :hotel do
    name { Faker::Company.name }
    location { Faker::Address.city }
  end
end