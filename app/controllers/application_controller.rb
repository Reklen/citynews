class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @articles = Article.last(2).reverse
    @events = Event.last(2).reverse
    @city_comments = CityComment.last(4).reverse
  end
end
