User.create!(
  name: '管理者',
  email: 'admin@example.com',
  password: 'admin123',
  admin: true,
)

20.times do |n|
  name     = Faker::Name.name
  email    = "sample#{n+1}@example.com"
  password = '123password'
  User.create!(
    name: name,
    email: email,
    password: password,
  )
end