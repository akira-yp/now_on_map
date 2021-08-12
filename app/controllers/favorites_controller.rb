class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @favorite = current_user.favorites.new(event_id: params[:event_id])
    respond_to do |format|
      if @favorite.save
        format.js
      else
        format.html { redirect_to @even, notice:"お気に入りできませんでした" }
      end
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @favorite = Favorite.find(params[:id])
    respond_to do |format|
      if @favorite.destroy
        @favorite = nil
        format.js
      else
        format.html { redirect_to @event, notice: "削除できませんでした"}
      end
    end
  end
end
