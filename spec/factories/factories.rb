FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :article do
  	title Faker::Lorem.sentence
  	description Faker::Lorem.paragraph
  	user
  end
end