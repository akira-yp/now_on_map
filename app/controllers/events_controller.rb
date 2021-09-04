class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @q = Event.ransack(params[:q])
    @categories = Category.all
    @events = Event.includes(:categories).where("start_date <= ?", Time.now).where("end_date >= ?", Time.now)
    gon.events = @events.map do | event |
       {
         'event':event,
         'categories':event.categories.pluck(:name),
         'date':"#{event.start_date.strftime("%Y年%m月%d日")} ~ #{event.end_date.strftime("%Y年%m月%d日")}",
         'countdate':"#{((event.end_date - Time.now)/60/60/24).ceil}"
       }
     end

    @day_searched = Time.now
    @hashtags = Hashtag.last(10).pluck(:name)
  end

  def search
    @q = Event.ransack(params[:q])
    @categories = Category.all
    @events = @q.result(search_params)
    @hashtags = Hashtag.last(10).pluck(:name)
    @day_searched = change_to_timeclass(search_params[:start_date_lteq_all])

    if search_params[:categories_id_eq] == ""
      @keyword = "全"
    else
      cat_index = @categories.ids.index(search_params[:categories_id_eq].to_i)
      @keyword = @categories[cat_index].name
    end

    today = Time.now

    gon.events = @events.map do | event |
      {
        'event':event,
        'categories':event.categories.pluck(:name),
        'date':"#{event.start_date.strftime("%Y年%m月%d日")} ~ #{event.end_date.strftime("%Y年%m月%d日")}",
        'countdate':"#{((event.end_date - today )/60/60/24).ceil if @day_searched.strftime('%Y%m%d') == today.strftime('%Y%m%d')}"
      }
    end

    render :index
  end

  def new
    @event = Event.new(latlng_params)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @event = current_user.events.build(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to mypage_user_path(current_user.id)}
        format.js {
          flash[:notice] = "新しいイベントを投稿しました"
          render js: "window.location = '#{posts_index_user_path(current_user.id)}' " }
      else
        format.js
      end
    end
  end

  def show
    @comments = @event.comments.all.order(created_at: "DESC")
    if user_signed_in?
      @comment = current_user.comments.build(event_id: params[:id])
      @favorite = current_user.favorites.find_by(event_id: @event.id)
    end
    respond_to do |format|
      format.js
    end
  end

  def edit
    gon.event = @event
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to posts_index_user_path(current_user.id),notice:"イベント内容を変更しました" }
        format.js {
          flash[:notice] = "イベント情報を更新しました"
          render js: "window.location = '#{posts_index_user_path(current_user.id)}' " }
      else
        format.js
      end
    end
  end

  def destroy
    if @event.destroy
      redirect_to events_path, notice:"イベントを削除しました"
    else
      redirect_to event_path(@event)
    end
  end

  def hashtag
    @q = Event.ransack(params[:q])
    @categories = Category.all
    @hashtags = Hashtag.last(10).pluck(:name)
    @hashtag = Hashtag.find_by(name: params[:name])
    @events = @hashtag.events.where("start_date <= ?", Time.now).where("end_date >= ?", Time.now)
    today = Time.now
    gon.events = @events.map do | event |
        {
        'event':event, 'categories':event.categories.pluck(:name),
        'date':"#{event.start_date.strftime("%Y年%m月%d日")} ~ #{event.end_date.strftime("%Y年%m月%d日")}", 'countdate':"#{((event.end_date - today )/60/60/24).ceil }"
        }
    end

    @day_searched = today
    @keyword = "##{@hashtag.name}"

    render :index
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :location, :start_date, :end_date, :official_page, :image, :latitude, :longitude, :image_cache, category_ids:[])
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def search_params
    params.require(:q).permit!
  end

  def latlng_params
    params.permit(:latitude,:longitude)
  end

  def change_to_timeclass(day)
    day = Time.now.strftime("%Y-%m-%d") if day == ""
    arr = day.split("-").map(&:to_i)
    Time.mktime(arr[0],arr[1],arr[2])
  end
end
