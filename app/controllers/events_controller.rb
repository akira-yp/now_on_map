class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_event, only: %i[show]

  def index
    @events = Event.all
    gon.events = @events
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def show
    gon.event = @event
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :location, :start_date, :end_date, :official_page, :image, :latitude, :longitude)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
