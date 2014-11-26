require 'rails_helper'

describe Store do 
	let(:user) { FactoryGirl.create(:user) }
	before { login_as(user, scope: :user) }

	it "is valid with name, address, and phone" do
		store = user.stores.create(name: "My Store", address: "Lorem ipsum", phone:"11-5555-5555")
		expect(store).to be_valid
	end

	it "is invalid without name" do
		store = user.stores.new(address: "Lorem ipsum", phone:"11-5555-5555")
		store.valid?
		expect(store.errors[:name]).to include("can't be blank")
	end

	it "is invalid without address" do
		store = user.stores.new(name: "My Store", phone:"11-5555-5555")
		store.valid?
		expect(store.errors[:address]).to include("can't be blank")
	end

	it "is invalid without phone" do
		store = user.stores.new(name: "My Store", address: "Lorem ipsum")
		store.valid?
		expect(store.errors[:phone]).to include("can't be blank")
	end

	it "is valid with a correct phone number format" do
		store = user.stores.new(name: "My Store", address: "Lorem ipsum", phone:"11-5555-5555")
		expect(store).to be_valid
	end

	it "is invalid with a wrong phone number format" do
		store = user.stores.new(name: "My Store", address: "Lorem ipsum", phone:"11-55555555")
		store.valid?
		expect(store.errors[:phone]).to include "bad format"
	end

	it "is invalid with a wrong website url format" do
		store = user.stores.new(name: "My Store", address: "Lorem ipsum", phone:"11-5555-5555", website: "www.google")
		store.valid?
		expect(store.errors[:website]).to include "bad format"
	end
end