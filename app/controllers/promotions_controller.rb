class PromotionsController < ApplicationController
	def index
		@promotions = Promotion.all
	end

	def show
		@promotion = Promotion.find(params[:id])
	end

	def new
		@promotion = Promotion.new
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
		@promotion = Promotion.find(params[:id])
	end

	def update
		@promotion = Promotion.find(params[:id])

		if @promotion.update(promo_params)
			redirect_to @promotion
		else
			flash[:notice] = "Ocorreu um erro ao fazer o update"
			render 'edit'
		end
	end

	def destroy
		promotion = Promotion.find(params[:id])

		promotion.delete
		flash[:notice] = "Promoção Apagada"

		redirect_to root_path
	end

	private
	def promo_params
		params.require(:promotion).permit(:title, :description, :photo, :price)
	end

end