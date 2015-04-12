# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

module PopulateDB

  PLACES = [{
              country: "Brasil",
              state: "São Paulo",
              city: "São Paulo",
              position: { latitude: 23.5500, longitude: 46.6333 }
            },
            {
              country: "Brasil",
              state: "Rio de Janeiro",
              city: "Rio de Janeiro",
              position: {latitude: 22.9068, longitude: 43.1729}
            }]

  def self.initialize
    self.deleteAll
    self.createUsers
    self.createArticles(60)
  end

  def self.createUsers
    homer = User.new(
      email: 'homer@example.com',
      password: '123456haa',
      password_confirmation: '123456haa',
      name: 'Homer Simpson',
      image: '/assets/homer.jpeg')
    homer.save!

    marge = User.new(
      email: 'marge@example.com',
      password: '123456hab',
      password_confirmation: '123456hab',
      name: 'Marge Simpson',
      image: '/assets/marge.jpeg')
    marge.save!

    lisa = User.new(
      email: 'lisa@example.com',
      password: '123456hac',
      password_confirmation: '123456hac',
      name: 'Lisa Simpson',
      image: '/assets/lisa.jpeg')
    lisa.save!

    @@users = [homer, marge, lisa]
  end

  def self.createArticles(number_of_articles)
    number_of_articles.times do
      user = @@users.sample
      article = user.articles.create(
        title: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph(3),
        picture_attributes: { photo: File.new("app/assets/images/medium/springfield.jpg") }
      )

      place = PLACES.sample
      location = Location.create(
        latitude: place[:position][:latitude],
        longitude: place[:position][:longitude],
        city: place[:city],
        country: place[:country],
        state: place[:state]
      )

      article.location = location
    end
  end

  def self.createEvents(number_of_events)
    number_of_events.times do
      user = @@users.sample
      event = user.events.create(
        title: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph(3),
        picture_attributes: { photo: File.new("app/assets/images/medium/springfield.jpg") }
      )

      place = PLACES.sample
      location = Location.create(
        latitude: place[:position][:latitude],
        longitude: place[:position][:longitude],
        city: place[:city],
        country: place[:country],
        state: place[:state]
      )

      event.location = location
    end
  end

  def self.deleteAll
    User.destroy_all
  end
end

PopulateDB.initialize
