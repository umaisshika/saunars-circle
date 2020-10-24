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