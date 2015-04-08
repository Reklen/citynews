FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :location do
    latitude 22.02
    longitude 22.02
    city "São Paulo"
    state "São Paulo"
    country "Brasil"
  end

  factory :article do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
    location
    user
  end

  factory :city_comment do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
    comment_type true
    user
  end

  factory :event do
    date DateTime.now.to_date
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
    user
  end

  factory :promotion do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
    price 100
    user
  end

  factory :job do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
    salary 1000
    user
  end
end