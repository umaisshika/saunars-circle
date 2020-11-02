FactoryBot.define do
  factory :comment do
    content { 'コメントテスト' }
    association :food
    association :user
  end
end