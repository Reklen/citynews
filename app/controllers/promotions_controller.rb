class PromotionsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_promotion, only: [:edit, :update, :destroy]

	def index
		@promotions = Promotion.all
	end

	def show
    @promotion = Promotion.find(params[:id])
	end

	def new
		@promotion = current_user.promotions.new
		respond_to do |format|
      format.html { render layout: false }
    end
	end

	def create
		@promotion = current_user.promotions.new(promo_params)
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
		params.require(:promotion).permit(:title, :description, :price, picture_attributes: [:photo])
	end

	def set_promotion
		@promotion = current_user.promotions.find(params[:id])
	end

end