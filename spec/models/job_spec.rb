require 'rails_helper'

describe Job do
	it "is valid with title, description and salary" do
		job = FactoryGirl.create(:job)
		expect(job).to be_valid
	end

end