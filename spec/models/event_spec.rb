require 'rails_helper'

describe Event do 
	let(:user) { FactoryGirl.create(:user) }
	before { login_as(user, scope: :user) }

	it "is valid with date, title, description" do 
		event = user.events.new(date: DateTime.now.to_date, title: "Lorem ipsum", description: "Lorem ipsum")
		expect(event).to be_valid
	end

	it "is invalid without date" do
		event = user.events.new(title: "Lorem ipsum", description: "Lorem ipsum")
		event.valid?
		expect(event.errors[:date]).to include "can't be blank"
	end

	it "is invalid without title" do
		event = user.events.new(date: DateTime.now.to_date, description: "Lorem ipsum")
		event.valid?
		expect(event.errors[:title]).to include "can't be blank"
	end

	it "is invalid without description" do
		event = user.events.new(date: DateTime.now.to_date, title: "Lorem ipsum")
		event.valid?
		expect(event.errors[:description]).to include "can't be blank"
	end
end