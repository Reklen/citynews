require 'rails_helper'

feature 'Promotion Manager' do
  let(:user) { FactoryGirl.create(:user) }
  before { login_as(user, scope: :user) }

  scenario 'displays index promotions' do
    visit root_path
    first('.nav-main').click_link("Promoções")
    expect(page).to have_content("Promoções da Semana")
  end

  scenario 'displays a promotion new page' do
  	visit root_path

  	first(".nav-user").click_link("Promoções")

  	expect(page).to have_content("Compartilhe uma promoção")
  end

  scenario 'creates a new promotion' do
    visit new_promotion_path

    promotion = FactoryGirl.build(:promotion)

    fill_in "promotion_title", with: promotion.title
    fill_in "promotion_description", with: promotion.description
    fill_in "promotion_price", with: promotion.price

    click_button "Enviar"

    expect(page).to have_content promotion.title

  end

  scenario "edit one promotion" do
    promotion = FactoryGirl.create(:promotion)

    visit edit_promotion_path(promotion)

    fill_in "promotion_title", with: "test"

    click_button "Enviar"

    expect(page).to have_content "test"
  end
end