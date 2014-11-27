require 'rails_helper'

describe ArticlesController do

	describe 'GET #index' do
		it 'assigns all articles as @articles' do
			article = FactoryGirl.create(:article)
			get :index
			expect(assigns(:articles)).to eq [article]
		end

		it 'renders the :index template' do
			get :index
			expect(response).to render_template :'articles/index'
		end
	end

	describe 'GET #show' do
		it 'assigns the requested article to @article' do
			article = FactoryGirl.create(:article)
			get :show, id: article
			expect(assigns(:article)).to eq article
		end

		it 'renders the :show template' do
			article = FactoryGirl.create(:article)
			get :show, id: article
			expect(response).to render_template :show
		end
	end



end