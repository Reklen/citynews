require 'rails_helper'

describe Event do 
	let(:user) { FactoryGirl.create(:user) }
	before { login_as(user, scope: :user) }

	it "is valid with date, title, description" do 
		event = user.events.new(date: DateTime.now.to_date, title: "Lorem ipsum", description: "Lorem ipsum")
		expect(event).to be_valid
	end

end