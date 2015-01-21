class PromotionsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_promotion, only: [:show, :create, :update, :destroy]

	def index
		@promotions = Promotion.all
	end

	def show
	end

	def new
		@promotion = current_user.promotions.new
	end

	def create
		if @promotion.save
			flash[:notice] = "Promoção criada com sucesso"
			redirect_to @promotion
		else
			render 'new'
		end

	end

	def edit
	end

	def update
		if @promotion.update(promo_params)
			redirect_to @promotion
		else
			flash[:notice] = "Ocorreu um erro ao fazer o update"
			render 'edit'
		end
	end

	def destroy
		promotion.delete
		flash[:notice] = "Promoção Apagada"

		redirect_to root_path
	end

	private
	def promo_params
		params.require(:promotion).permit(:title, :description, :photo, :price)
	end

	def set_promotion
		@promotion = current_user.promotion.find(params[:id])
	end

end