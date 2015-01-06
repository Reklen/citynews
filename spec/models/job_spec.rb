require 'rails_helper'

describe Job do
	it "is valid with title, description and salary" do
		job = FactoryGirl.create(:job)
		expect(job).to be_valid
	end

	it "is invalid without title" do
		job = FactoryGirl.build(:job, title: nil)
		job.valid?
		expect(job.errors[:title]).to include("can't be blank")
	end

	it "is invalid without description" do
		job = FactoryGirl.build(:job, description: nil)
		job.valid?
		expect(job.errors[:description]).to include("can't be blank")
	end

end