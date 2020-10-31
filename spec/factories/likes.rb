FactoryBot.define do
  factory :like do
    food_id {1}
    user_id {1}
    association :food
    association :user
  end
end