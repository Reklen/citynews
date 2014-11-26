require 'rails_helper'

describe CityComment do 
	let(:user) { FactoryGirl.create(:user) }
	before { login_as(user, scope: :user) }

	it "is valid with title comment_type, description" do 
		city_comment = user.city_comments.new(title:"clean city", description: "The city is been very clean, congrats!", comment_type: true)
		expect(city_comment).to be_valid
	end

	it "is invalid without title" do
		city_comment = user.city_comments.new(description: "The city is been very clean, congrats!", comment_type: true)
		city_comment.valid?
		expect(city_comment.errors[:title]).to include "can't be blank"
	end

	it "is invalid without description" do
		city_comment = user.city_comments.new(title:"clean city", comment_type: true)
		city_comment.valid?
		expect(city_comment.errors[:description]).to include "can't be blank"
	end

	it "is invalid without comment_type" do
		city_comment = user.city_comments.new(title:"clean city", description: "The city is been very clean, congrats!")
		city_comment.valid?
		expect(city_comment.errors[:comment_type]).to include "can't be blank"
	end

	it "is invalid with a non boolean comment_type" do
		city_comment = user.city_comments.new(title:"clean city", description: "The city is been very clean, congrats!", comment_type: "a")
		expect(city_comment).to be_invalid
	end	

end