FactoryBot.define do
  factory :post do
    comment {Faker::Lorem.sentence}
    association :user
    association :topic
  end
end
