FactoryBot.define do
  factory :topic do
    title {Faker::Team.name}
  end
end
