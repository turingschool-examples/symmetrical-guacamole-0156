FactoryBot.define do
  factory :room do
    rate { Faker::Number.between(from: 100, to: 300) }
    suite { Faker::Name.initials }
  end
end