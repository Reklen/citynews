require 'rails_helper'

describe Event do
  let(:user) { FactoryGirl.create(:user) }
  before { login_as(user, scope: :user) }

  it "is valid with date, title, description" do
    event = FactoryGirl.create(:event)
    expect(event).to be_valid
  end

  it "is invalid without date" do
    event = FactoryGirl.build(:event, date: nil)
    event.valid?
    expect(event.errors[:date]).to include "não pode ficar em branco"
  end

  it "is invalid without title" do
    event = FactoryGirl.build(:event, title: nil)
    event.valid?
    expect(event.errors[:title]).to include "não pode ficar em branco"
  end

  it "is invalid without description" do
    event = FactoryGirl.build(:event, description: nil)
    event.valid?
    expect(event.errors[:description]).to include "não pode ficar em branco"
  end

  describe "#search_by_location" do
    it "returns the nearest events to a point" do
      event = FactoryGirl.create(:event)
      Event.reindex
      Event.searchkick_index.refresh

      event_json = {
        'id' => 1,
        'city' => 'São Paulo',
        'state' => 'São Paulo',
        'country' => 'Brasil'
      }

      event_searched = Event.search_by_location(22.02, 22.02, "10000km").first
      expect(event_searched).to include event_json
    end
  end
end