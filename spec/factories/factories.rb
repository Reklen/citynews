FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :article do
  	title Faker::Lorem.sentence
  	description Faker::Lorem.paragraph
  	photo Faker::Company.logo

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
  	photo Faker::Company.logo
  end
end