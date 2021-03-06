require 'rails_helper'

describe Article do

  let(:user) { FactoryGirl.create(:user) }
  before { login_as(user, scope: :user) }

  it "is valid with a title, description" do
    article = FactoryGirl.create(:article)
    expect(article).to be_valid
  end

  it "is invalid without a title" do
    article = FactoryGirl.build(:article, title: nil)
    article.valid?
    expect(article.errors[:title]).to include("não pode ficar em branco")
  end

  it "is invalid without a description" do
    article = FactoryGirl.build(:article, description: nil)
    article.valid?
    expect(article.errors[:description]).to include("não pode ficar em branco")
  end

  describe "#search_by_location" do
    it "returns articles near to one point" do
      article = FactoryGirl.create(:article)
      Article.reindex
      Article.searchkick_index.refresh

      article_json = {
        'id' => 1,
        'city' => 'São Paulo',
        'state' => 'São Paulo',
        'country' => 'Brasil'
      }

      article_searched = Article.search_by_location("22.02", "22.02", "100").first
      expect(article_searched).to include article_json
    end

    it "doesn't returns any article near to a point" do
      article = FactoryGirl.create(:article)
      Article.reindex
      Article.searchkick_index.refresh

      article_searched = Article.search_by_location("2.02", "2.02", "100").first
      expect(article_searched).to be_nil
    end
  end
end