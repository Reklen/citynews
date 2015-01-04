class PromottionController > AplicationController
	def index
		@promotions = Promotion.all
	end

end