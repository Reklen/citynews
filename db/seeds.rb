# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# user = User.new
# user.email = 'test@example.com'
# user.password = '123456'
# user.password_confirmation = '123456'
# user.name = 'John'
# user.save!

user.first

30.times do
  article = user.articles.create(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph(3),
  )

  location = Location.create(
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    city: Faker::Address.city,
    country: Faker::Address.country,
    state: Faker::Address.state
  )

  article.location = location
end