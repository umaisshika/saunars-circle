FactoryBot.define do
  factory :comment do
    content { 'コメントテスト' }
    association :food
    association :user

    trait :invalid do
      content { nil }
    end
  end
end
