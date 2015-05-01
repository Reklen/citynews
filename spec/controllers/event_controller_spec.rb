require  'rails_helper'

describe EventsController do
  let(:user) { FactoryGirl.create(:user) }
  before { login_as(user, scope: user) }

  describe 'GET #index' do
    it 'renders the application index view' do
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

    it 'responds with a valid json file' do
      event = FactoryGirl.create(:event)
      Event.reindex
      Event.searchkick_index.refresh

      get :search, latitude: '22.01', longitude: '22.01', distance: '100',
      format: :json

      expected_json = {
        'id' => 1,
        'city' => 'São Paulo',
        'state' => 'São Paulo',
        'country' => 'Brasil'
      }
      parsed_response = JSON.parse(response.body).first

      expect(parsed_response).to include expected_json
    end

    it 'returns a nil objec, when not found' do
      event = FactoryGirl.create(:event)
      Event.reindex
      Event.searchkick_index.refresh

      get :search, latitude: '0', longitude: 0, distance: '0',
          format: :json

      parsed_response = JSON.parse(response.body).first
      expect(parsed_response).to be_nil
    end
  end
end