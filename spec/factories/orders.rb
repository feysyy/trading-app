FactoryBot.define do
  factory :order do
    user
    company
    quantity { Faker::Number.between(from: 1, to: 5) }
    price { Faker::Number.between(from: 100, to: 500) }
  end
end
