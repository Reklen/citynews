require 'rails_helper'

feature 'Promotion Manager' do
  scenario 'displays index promotions' do
    visit root_path
    find('.nav-main').click_link("Promoções")
    expect(page).to have_content("Promoções da Semana")
  end
end