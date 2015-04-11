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


  # describe "#search_by_location" do
  #   it "returns articles related to one city" do
  #     article_1 = Article.create(title: "title", description: "desc")
  #     article_2 = FactoryGirl.build(:article_2)

  #     articles_created = art

  #     articles = Article.search_by_location(20, 20, "100km")

  #     expect(articles).to be_equal(articles_created)
  #   end
  # end
end