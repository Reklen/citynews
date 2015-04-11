require 'rails_helper'

describe Promotion do
	let(:user) { FactoryGirl.create(:user) }
	before { login_as(user, scope: :user) }

	it 'is valid with title, description, price' do
		promo = FactoryGirl.create(:promotion)
		expect(promo).to be_valid
	end

	it "is invalid without title" do
		promo = FactoryGirl.build(:promotion, title: nil)
		promo.valid?
		expect(promo.errors[:title]).to include "não pode ficar em branco"
	end

	it "is invalid without description" do
		promo = FactoryGirl.build(:promotion, description: nil)
		promo.valid?
		expect(promo.errors[:description]).to include "não pode ficar em branco"
	end

	it "is invalid without price" do
		promo = FactoryGirl.build(:promotion, price: nil)
		promo.valid?
		expect(promo.errors[:price]).to include "não pode ficar em branco"
	end

	it "is invalid when price is not set with number" do
		promo = FactoryGirl.build(:promotion, price: "a")
		expect(promo).to_not be_valid
	end
end