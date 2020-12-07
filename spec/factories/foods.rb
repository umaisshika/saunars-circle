FactoryBot.define do
  factory :food do
    name { 'カレーライス' }
    visited_sauna { 'かるまる' }
    prefecture_id { '1' }
    description { 'スタンダードなカレー' }
    image { File.open('spec/factories/images/test.jpg') }
    association :user
  end
end
