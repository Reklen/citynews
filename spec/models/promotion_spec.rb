require 'rails_helper'

describe Promotion do
	let(:user) { FactoryGirl.create(:user) }
	before { login_as(user, scope: :user) }

	let(:store) { user.stores.create(name: "My Store", address: "Lorem ipsum", phone:"11-5555-5555") }

	it 'is valid with title, description, price' do
		promo = FactoryGirl.create(:promotion)
		expect(promo).to be_valid
	end

	it "is invalid without title" do
		promo = store.promotions.new(description: "Buy one chicken and recive 12 eggs for free", price: 20)
		promo.valid?
		expect(promo.errors[:title]).to include "can't be blank"
	end

	it "is invalid without description" do
		promo = store.promotions.new(title: "Chicken with eggs", price: 20)
		promo.valid?
		expect(promo.errors[:description]).to include "can't be blank"
	end

	it "is invalid without price" do
		promo = store.promotions.new(title: "Chicken with eggs", description: "Buy one chicken and recive 12 eggs for free")
		promo.valid?
		expect(promo.errors[:price]).to include "can't be blank"
	end

	it "is invalid when price is not set with number" do
		promo = store.promotions.new(title: "Chicken with eggs", description: "Buy one chicken and recive 12 eggs for free", price: "a")
		expect(promo).to_not be_valid
	end
end