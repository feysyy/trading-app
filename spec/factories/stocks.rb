FactoryBot.define do
  factory :stock do
    user
    company
    quantity { 20 }
  end
end
