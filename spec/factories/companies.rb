FactoryBot.define do
  factory :company do
    symbol { Faker::Alphanumeric.unique.alpha(number: rand(3..4)).upcase }
    name { Faker::Company.name.capitalize }

    trait :nike do
      symbol { "NKE" }
      name { "Nike Inc" }
    end
  end
end
