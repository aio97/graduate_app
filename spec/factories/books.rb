FactoryBot.define do
  factory :book do
    title { |n| "タイトル#{n}"}
    association :user
  end
end
