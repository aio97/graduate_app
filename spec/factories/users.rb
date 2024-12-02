FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test_1@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
