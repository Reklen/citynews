require 'rails_helper'

describe CityComment do
	let(:user) { FactoryGirl.create(:user) }
	before { login_as(user, scope: :user) }

	it "is valid with title comment_type, description" do
		city_comment = FactoryGirl.create(:city_comment)
		expect(city_comment).to be_valid
	end

	it "is invalid without title" do
		city_comment = FactoryGirl.build(:city_comment, title: nil)
		city_comment.valid?
		expect(city_comment.errors[:title]).to include "can't be blank"
	end

	it "is invalid without description" do
		city_comment = FactoryGirl.build(:city_comment, description: nil)
		city_comment.valid?
		expect(city_comment.errors[:description]).to include "can't be blank"
	end

	it "is invalid without comment_type" do
		city_comment = FactoryGirl.build(:city_comment, comment_type: nil)
		city_comment.valid?
		expect(city_comment.errors[:comment_type]).to include "can't be blank"
	end

	it "is invalid with a non boolean comment_type" do
		city_comment = FactoryGirl.build(:city_comment, comment_type: "a")
		expect(city_comment).to be_invalid
	end

end