require 'rails_helper'

describe Store do

	it "is valid with name, address, and phone" do
		store = FactoryGirl.create(:store)
		expect(store).to be_valid
	end

	it "is invalid without name" do
		store = FactoryGirl.build(:store, name: nil)
		store.valid?
		expect(store.errors[:name]).to include("can't be blank")
	end

	it "is invalid without address" do
		store = FactoryGirl.build(:store, address: nil)
		store.valid?
		expect(store.errors[:address]).to include("can't be blank")
	end

	it "is invalid without phone" do
		store = FactoryGirl.build(:store, phone: nil)
		store.valid?
		expect(store.errors[:phone]).to include("can't be blank")
	end

	it "is invalid with a wrong phone number format" do
		store = FactoryGirl.build(:store, phone: "11-55555555")
		store.valid?
		expect(store.errors[:phone]).to include "bad format"
	end

	it "is invalid with a wrong website url format" do
		store = FactoryGirl.build(:store, website: "www.google")
		store.valid?
		expect(store.errors[:website]).to include "bad format"
	end
end