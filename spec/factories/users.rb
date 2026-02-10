FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
    confirmed_at { Time.zone.today }
    balance { 100_000 }

      trait :admin do
        role { true }
        verified { true }
      end

      trait :verified_user do
        verified { true }
      end
  end
end
