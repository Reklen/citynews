class EventsController < ApplicationController

	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
	end

	def create
		@event = current_user.events.new(event_params)

		if @event.save
			redirect_to @event
		else
			render 'new'
		end
	end

	private
		def event_params
			params.require(:event).permit(:title, :description, :date, :photo, :user_id)
		end

end