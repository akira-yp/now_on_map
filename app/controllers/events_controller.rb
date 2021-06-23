class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_event, only: %i[show edit update]

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
      redirect_to events_path, notice:"新しいイベントを投稿しました"
    else
      render :new
    end
  end

  def show
    gon.event = @event
  end

  def edit
    gon.event = @event
  end

  def update
    if @event.update(event_params)
      redirect_to event_path, notice:"イベント内容を変更しました"
    else
      render :edit
    end
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :location, :start_date, :end_date, :official_page, :image, :latitude, :longitude, :image_cache)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
