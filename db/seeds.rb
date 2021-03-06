srand

User.create!(name:  "Example User",
    email: "example@bradyklein.com",
    password:              "foobar",
    password_confirmation: "foobar",
    admin: true,
    activated: true,
    activated_at: Time.zone.now )

99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@bradyklein.com"
password = "password"
User.create!( name:  name,
              email: email,
              password: password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now )
end

users = User.order(:created_at).take(6)
50.times do
  name = Faker::Lorem.sentence(1)
  description = Faker::Lorem.sentence(5)
  users.each { |user| user.games.create!(name: name, description: description) }
end

20.times do
  name = Faker::Lorem.sentence(1)
  description = Faker::Lorem.sentence(5)
  Group.create!(name: name,
                description: description )
end

# Following relationships
users = User.all
groups = Group.all
users.each do |u|
  groups[rand(10)].users << u
  groups[rand(10) + 10].users << u
end