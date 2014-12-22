class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :weather


  def index
  	@articles = Article.last(2).reverse
  end

  def weather
  	@weather = Weather.lookup(12820853, Weather::Units::CELSIUS)
  end
end
