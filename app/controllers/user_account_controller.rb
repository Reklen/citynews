class UserAccountController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = current_user.articles.all
    @events = current_user.events.all
    @jobs = current_user.jobs.all
    @city_comments = current_user.city_comments.all
  end
end