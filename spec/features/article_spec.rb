require 'rails_helper'

feature "Article management" do
  let(:user) { FactoryGirl.create(:user) }
  before { login_as(user, scope: :user) }

  scenario "creates a new article" do
    article = FactoryGirl.build(:article)

    visit root_path

    first(".nav-user").click_link('Notícias')

    fill_in 'article_title', with: article.title
    fill_in 'article_description', with: article.description

    click_button 'Enviar'

    expect(page).to have_content article.title
  end

  scenario "update an article" do
    location = FactoryGirl.build(:location)
    article = user.articles.create(title: "title", description: "description", location: location )
    new_article = FactoryGirl.build(:article)

    visit article_path(article)

    click_link "Editar"

    fill_in 'article_title', with: new_article.title
    fill_in 'article_description', with: new_article.description

    click_button 'Enviar'

    expect(page).to have_content "Notícia alterada com sucesso"
  end

  scenario "delete an article" do
    location = FactoryGirl.build(:location)
    article = user.articles.create(title: "title", description: "description", location: location)

    visit article_path(article)

    click_link "Deletar"

    expect(page).to have_content "Notícia apagada"
  end

  # scenario "Show all articles" do
  #   visit root_path

  #   first(".nav-main").click_link('Notícias')

  #   expect(page).to have_content "Notícias"
  # end
end

