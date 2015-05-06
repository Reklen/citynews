require 'rails_helper'

feature "Article management" do
  let(:user) { FactoryGirl.create(:user) }
  before { login_as(user, scope: :user) }

  scenario "creates a new article" do
    location = FactoryGirl.build(:location)
    article = FactoryGirl.build(:article)

    visit new_article_path

    fill_in 'article_title', with: article.title
    fill_in 'article_description', with: article.description
    find('#article_location_attributes_latitude').set(location.latitude)
    find('#article_location_attributes_longitude').set(location.longitude)
    find('#article_location_attributes_city').set(location.city)
    find('#article_location_attributes_state').set(location.state)
    find('#article_location_attributes_country').set(location.country)
    find('#article_picture_attributes_photo').set(article.picture.photo)

    click_button 'Enviar'

    expect(page).to have_content article.title
  end

  scenario "update an article" do
    location = FactoryGirl.build(:location)
    picture = FactoryGirl.build(:picture)
    article = user.articles.create(title: "title", description: "description",
                                   location: location, picture: picture )
    new_article = FactoryGirl.build(:article)

    visit article_path(article)

    click_link "Editar"

    fill_in 'article_title', with: new_article.title
    fill_in 'article_description', with: new_article.description
    find('#article_location_attributes_latitude').set(location.latitude)
    find('#article_location_attributes_longitude').set(location.longitude)
    find('#article_location_attributes_city').set(location.city)
    find('#article_location_attributes_state').set(location.state)
    find('#article_location_attributes_country').set(location.country)

    click_button 'Enviar'

    expect(page).to have_content "Notícia alterada com sucesso"
  end

  scenario "delete an article" do
    location = FactoryGirl.build(:location)
    picture = FactoryGirl.build(:picture)
    article = user.articles.create(title: "title", description: "description",
                                   location: location, picture: picture)

    visit article_path(article)

    click_link "Deletar"

    expect(page).to have_content "Notícia apagada"
  end

  scenario "Show all articles" do
    it "pending show all articles" do
      visit root_path

      first(".nav-main").click_link('Notícias')

      expect(page).to have_content "Notícias"
    end
  end
end

