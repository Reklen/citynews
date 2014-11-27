require 'rails_helper'

describe Event do
	let(:user) { FactoryGirl.create(:user) }
	before { login_as(user, scope: :user) }

	it "is valid with date, title, description" do
		event = FactoryGirl.create(:event)
		expect(event).to be_valid
	end

	it "is invalid without date" do
		event = FactoryGirl.build(:event, date: nil)
		event.valid?
		expect(event.errors[:date]).to include "can't be blank"
	end

	it "is invalid without title" do
		event = FactoryGirl.build(:event, title: nil)
		event.valid?
		expect(event.errors[:title]).to include "can't be blank"
	end

	it "is invalid without description" do
		event = FactoryGirl.build(:event, description: nil)
		event.valid?
		expect(event.errors[:description]).to include "can't be blank"
	end
end