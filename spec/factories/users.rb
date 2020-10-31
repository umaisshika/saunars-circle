FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'test1234' }
    password_confirmation { 'test1234' }
  end
end
