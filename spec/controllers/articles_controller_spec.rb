require 'rails_helper'

describe ArticlesController do
  let(:user) { FactoryGirl.create(:user) }
  before { login_as(user, scope: :user) }

  describe 'GET #index' do
    it 'redirects to application index page' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:'application/index')
    end
  end

  describe 'GET #search' do
    it 'responds with a json file' do
      get :search, latitude: '22.01', longitude: '22.01', distance: '100',
          format: :json

      expect(response).to be_success
    end

    it 'searchs and responds with a json' do
      article = FactoryGirl.create(:article)
      Article.reindex
      Article.searchkick_index.refresh

      get :search, latitude: '22.01', longitude: '22.01', distance: '1000',
          format: :json

      expected_response = {
        'id' => 1,
        'city' => 'São Paulo',
        'state' => 'São Paulo',
        'country' => 'Brasil'
      }

      parsed_response = JSON.parse(response.body).first

      expect(parsed_response).to include expected_response
    end

    it "returns a nil object, when not found" do
      article = FactoryGirl.create(:article)
      Article.reindex
      Article.searchkick_index.refresh

      get :search, latitude: '2', longitude: '2', distance: '1000',
          format: :json

      parsed_response = JSON.parse(response.body).first

      expect(parsed_response).to be_nil
    end
  end
end