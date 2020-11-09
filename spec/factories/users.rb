FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password_digest { Faker::Dessert.topping }
    api_key { SecureRandom.uuid }
  end
end
