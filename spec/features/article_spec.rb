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

		click_button 'Novo Artigo'

		expect(page).to have_content article.title
	end
end

