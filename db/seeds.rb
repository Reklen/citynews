# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

homer = User.new(
  email: 'homer@example.com',
  password: '123456haa',
  password_confirmation: '123456haa',
  name: 'Homer Simpson',
  image: 'homer.jpeg')
homer.save!

marge = User.new(
  email: 'marge@example.com',
  password: '123456hab',
  password_confirmation: '123456hab',
  name: 'Marge Simpson',
  image: 'marge.jpeg')
marge.save!

lisa = User.new(
  email: 'lisa@example.com',
  password: '123456hac',
  password_confirmation: '123456hac',
  name: 'Lisa Simpson',
  image: 'lisa.jpeg')
lisa.save!

users = [homer, marge, lisa]


30.times do
  user = users.sample
  article = user.articles.create(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph(3)
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