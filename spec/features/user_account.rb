require 'rails_helper'

feature 'User Account Management' do
  let(:user) { FactoryGirl.create(:user) }
  before { login_as(user, scope: :user)}

  scenario 'visits the main user information' do
    visit root_path
    click_link 'Minha Conta'

    expect(page).to have_content 'Meus Artigos'
  end
end