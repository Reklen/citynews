require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe Article do
	
	let(:user) { FactoryGirl.create(:user) }
	before { login_as(user, scope: :user) }

	it "is valid with a title, description" do 
		article = user.articles.create(title: "Hi", description: "Lorem ipsum")
		expect(article).to be_valid
	end
end