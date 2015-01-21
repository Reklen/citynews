class EventsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_event, only: [:show, :edit, :update, :destroy]
	
	def index
		@events = Event.all
	end

	def show
	end

	def new
		@event = current_user.events.new
	end

	def create
		@event = current_user.events.new(event_params)

		if @event.save
			redirect_to @event
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @event.update(event_params)
			flash[:notice] = "Evento alterado"
			redirect_to @event
		else
			render 'edit'
		end
	end

	def destroy
		@event.delete
		flash[:notice] = "Evento deletado"
		redirect_to events_path
	end

	private
		def event_params
			params.require(:event).permit(:title, :description, :date, :photo, :user_id)
		end

		def set_event
			@event = current_user.events.find(params[:id])
		end

end