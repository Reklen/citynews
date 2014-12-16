require 'rails_helper'

feature "Article management" do
	let(:user) { FactoryGirl.create(:user) }
	before { login_as(user, scope: :user) }

	scenario "creates a new article" do
		article = FactoryGirl.build(:article)

		visit root_path

		click_link 'Novo'

		fill_in 'Título', with: article.title
		fill_in 'Descrição', with: article.description

		click_button 'Enviar'

		expect(page).to have_content article.title
	end

	scenario "update an article" do
		article = FactoryGirl.create(:article)
		new_article = FactoryGirl.build(:article)

		visit article_path(article)

		click_link "Editar"

		fill_in 'Título', with: new_article.title
		fill_in 'Descrição', with: new_article.description

		click_button 'Enviar'

		expect(page).to have_content "Artigo alterado com sucesso"
	end

	scenario "delete an article" do
		article = FactoryGirl.create(:article)

		visit article_path(article)

		click_link "Deletar"

		expect(page).to have_content "Artigo deletado"
	end
end

