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

  # factory :photo do
  #   photo
  # end

  factory :picture do
    # photo_file_name "test.jpeg"
    # photo_content_type "image/jpeg"
    # photo_file_size 1024
    # photo File.new('app/assets/images/missing.png')
  end

  factory :article do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
    picture
    location
    user
  end

  factory :event do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
    picture
    location
    user
    date DateTime.now.to_date
  end

  factory :city_comment do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
    comment_type true
    location
    user
  end

  factory :promotion do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
    location
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