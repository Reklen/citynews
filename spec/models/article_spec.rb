require 'rails_helper'

describe Article do

	let(:user) { FactoryGirl.create(:user) }
	before { login_as(user, scope: :user) }

	it "is valid with a title, description" do
		article = FactoryGirl.create(:article)
		expect(article).to be_valid
	end

	it "is invalid without a title" do
		article = FactoryGirl.build(:article, title: nil)
		article.valid?
		expect(article.errors[:title]).to include("can't be blank")
	end

	it "is invalid without a description" do
		article = FactoryGirl.build(:article, description: nil)
		article.valid?
		expect(article.errors[:description]).to include("can't be blank")
	end
end