require 'rails_helper'

feature 'Validate Links in the page' do
  let(:user) { FactoryGirl.create(:user) }
  before { login_as(user, scope: :user) }

  scenario "display the index page" do
    city_comment = FactoryGirl.build(:city_comment)

    visit root_path
    first(".nav-main").click_link("Fale com a prefeitura")

    expect(page).to have_content("Recado para a prefeitura")
  end

  scenario "create a new city comment" do
    city_comment = FactoryGirl.build(:city_comment)

    visit root_path
    first(".nav-user").click_link("Prefeitura")
    fill_in 'city_comment_title', with: city_comment.title
    fill_in 'city_comment_description', with: city_comment.description
    find('#city_comment_comment_type').set(true)

    click_button 'Enviar'

    expect(page).to have_content(city_comment.title)
  end

  scenario "updates a a current city comment" do
    location = FactoryGirl.build(:location)
    city_comment = user.city_comments.create(title: "Hi", description: "Hi", comment_type: true, location: location)

    visit city_comment_path(city_comment)
    click_link "Editar"
    fill_in 'city_comment_title', with: "Hey cityhall"

    click_button 'Enviar'

    expect(page).to have_content("Hey cityhall")
  end

  scenario "deletes one city comment" do
    location = FactoryGirl.build(:location)
    city_comment = user.city_comments.create(title: "Hi", description: "Hi", comment_type: true, location: location)

    visit city_comment_path(city_comment)
    click_link "Deletar"

    expect(page).to have_content "Recado para a prefeitura"
  end
end