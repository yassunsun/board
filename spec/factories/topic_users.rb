FactoryBot.define do
  factory :topic_user do
    association :user
    association :topic
  end
end