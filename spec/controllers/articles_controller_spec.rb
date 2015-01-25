require 'rails_helper'

describe ArticlesController do
	let(:user) { FactoryGirl.create(:user) }
	before { login_as(user, scope: :user) }

	describe 'GET #index' do
		xit 'assigns all articles as @articles' do
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

	describe 'GET #new' do
		xit "assigns a new Article to @article" do
			article = user.articles.create(:article)

			get :new
			expect(assigns(:article)).to be_a_new(Article)
		end

		xit "renders the :new template" do
			article = user.articles.new()

			get :new
			expect(response).to render_template :new
		end
	end

	describe 'GET #edit' do
		xit "assigns the request article to @article" do
			article = FactoryGirl.create(:article)
			get :edit, id: article
			expect(assigns(:article)).to eq article
		end

		xit "renders the :edit template" do
			article = FactoryGirl.create(:article)
			get :edit, id: article
			expect(response).to render_template :edit
		end
	end




	describe 'POST #create' do
		context "with valid attributes" do
			xit "saves the new article in the database" do
				expect{
					# creating a hash containing a contact’s attributes and passing them to the controller.
					post :create,
								article: FactoryGirl.build(:article).attributes
				}.to change(Article, :count).by 1
			end

			xit "redirects to articles#show" do
				post :create,
						 article: FactoryGirl.build(:article).attributes
				expect(response).to redirect_to article_path(assigns[:article])
			end
		end

		context "with invalid attributes" do
			xit "does not save the article in the database" do
				expect{
					post :create,
						article: FactoryGirl.build(:article, title: nil).attributes
				}.to_not change(Article, :count)
			end

			xit "re-renders the :new template" do
				post :create, article: FactoryGirl.build(:article, title: nil).attributes
				expect(response).to render_template :new
			end
		end
	end

	describe 'PATCH #update' do
		before :each do
			@article = FactoryGirl.create(:article)
		end
		context "valid attributes" do
			xit "locates the requested @article" do
				patch :update, id: @article
			end
		end
	end
end