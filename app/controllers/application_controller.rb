class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :weather


  def index
    @articles = Article.last(2).reverse
    @eventes = Event.last(2).reverse
    @city_comments = CityComment.last(4).reverse
  end

  def weather
    #Weather.lookup(428306, Weather::Units::CELSIUS) ||
    @weather = Weather.lookup(455827, Weather::Units::CELSIUS)
  end
end
