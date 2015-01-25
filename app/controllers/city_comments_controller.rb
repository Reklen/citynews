class CityCommentsController < ApplicationController
	before_action :authenticate_user, except: [:index, :show]

	def index
		@city_comments = CityComments.all
	end
end