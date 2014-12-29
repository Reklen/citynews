FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :article do
  	title Faker::Lorem.sentence
  	description Faker::Lorem.paragraph
    user

  	#photo do
     # extend ActionDispatch::TestProcess
      #fixture_file_upload(Faker::Lorem.word, 'image/png')
    #end

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
  	# photo Faker::Company.logo
  	user
  end

  factory :store do
  	name Faker::Company.name
  	address Faker::Address.street_address
  	phone "11-5555-5555"
  	website Faker::Internet.url
  	picture_path Faker::Company.logo
  	user
  end

  factory :promotion do
		title Faker::Lorem.sentence
  	description Faker::Lorem.paragraph
  	photo Faker::Company.logo
  	price 100
  	store
  end
end