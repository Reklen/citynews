class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :search]
  before_action :set_event, only: [:edit, :update, :destroy]

  def search
    render json: Event.search_by_location(
      params[:latitude],
      params[:longitude],
      params[:distance]
    )
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.new
    respond_to do |format|
      format.html { render layout: false }
    end
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
    params.require(:event).permit(:title, :description, :date, :user_id, picture_attributes: [:photo])
  end

  def set_event
    @event = current_user.events.find(params[:id])
  end
end