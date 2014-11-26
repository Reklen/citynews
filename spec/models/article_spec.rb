require 'rails_helper'

describe Article do
	
	let(:user) { FactoryGirl.create(:user) }
	before { login_as(user, scope: :user) }

	it "is valid with a title, description" do 
		article = user.articles.create(title: "Hi", description: "Lorem ipsum")
		expect(article).to be_valid
	end

	it "is invalid without a title" do
		article = user.articles.new(description: "Lorem ipsum")
		article.valid?
		expect(article.errors[:title]).to include("can't be blank")
	end

	it "is invalid without a description" do
		article = user.articles.new(title: "Lorem ipsum")
		article.valid?
		expect(article.errors[:description]).to include("can't be blank")
	end
end