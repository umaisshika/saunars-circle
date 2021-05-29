FactoryBot.define do
  factory :admin do
    name { '管理者' }
    email { 'admin@example.com' }
    password { 'admin123' }
    password_confirmation { 'admin123' }
  end
end