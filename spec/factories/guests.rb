FactoryBot.define do
  factory :guest do
    name { Faker::Name.name }
    nights { Faker::Number.between(from: 1, to: 3) }
  end
end
