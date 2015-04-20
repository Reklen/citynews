require 'rails_helper'

describe ArticlesController do
  let(:user) { FactoryGirl.create(:user) }
  before { login_as(user, scope: :user) }

  describe 'GET #search' do
    it 'responds with a json file' do
      get :search, latitude: '22.01', longitude: '22.01', distance: '100',
          format: :json

      expect(response).to be_success
    end

    it 'searchs and responds with a json' do
      article = FactoryGirl.create(:article)
      article.reindex
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
  end
end