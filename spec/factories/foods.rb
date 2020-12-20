FactoryBot.define do
  factory :food do
    name { 'カレーライス' }
    visited_sauna { 'かるまる' }
    prefecture_id { 1 }
    description { 'スタンダードなカレー' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/images/test.jpg')) }
    association :user
  end

  trait :invalid do
    name { nil }
  end
end
