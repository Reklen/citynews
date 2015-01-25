class CityCommentsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_city_comment, only: [:edit, :update, :destroy]

	def index
		@city_comments = CityComment.all
	end

	def show
		@city_comment = CityComment.find(params[:id])
	end

	def new
		@city_comment = current_user.city_comments.new
	end

	def create
		@city_comment = current_user.city_comments.new(city_params)

		if @city_comment.save
			flash[:notice] = "Comentário salvo com sucesso"
			redirect_to @city_comment
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @city_comment.update(city_params)
			redirect_to @city_comment
		else
			render 'edit'
		end
	end

	private
	def city_params
		params.require(:city_comment).permit(:user_id, :title, :description, :comment_type, picture_attributes: [:photo])
	end

	def set_city_comment
		@city_comment = current_user.city_comments.find(params[:id])
	end
end