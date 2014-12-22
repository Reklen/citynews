require 'rails_helper'

feature "Article management" do
	let(:user) { FactoryGirl.create(:user) }
	before { login_as(user, scope: :user) }

	scenario "creates a new article" do
		article = FactoryGirl.build(:article)

		visit root_path

		click_link('novo')

		fill_in 'article_title', with: article.title
		fill_in 'article_description', with: article.description

		click_button 'Enviar'

		expect(page).to have_content article.title

	end

	scenario "update an article" do
		article = user.articles.create(title: "title", description: "description")
		new_article = FactoryGirl.build(:article)

		visit article_path(article)

		click_link "Editar"

		fill_in 'article_title', with: new_article.title
		fill_in 'article_description', with: new_article.description

		click_button 'Enviar'

		expect(page).to have_content "Artigo alterado com sucesso"
	end

	scenario "delete an article" do
		article = user.articles.create(title: "title", description: "description")

		visit article_path(article)

		click_link "Deletar"

		expect(page).to have_content "Artigo deletado"
	end

	scenario "Show all articles" do
		visit root_path

		click_link 'Notícias'

		expect(page).to have_content "Notícias"
	end
end

