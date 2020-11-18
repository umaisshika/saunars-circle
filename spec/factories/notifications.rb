FactoryBot.define do
  factory :notification do
    association :visitor, factory: :user
    association :visited, factory: :user
    action { 'comment' }
    checked { false }
  end
end
