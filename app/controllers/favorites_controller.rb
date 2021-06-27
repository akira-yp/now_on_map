class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(event_id: params[:event_id])
    redirect_to event_path(favorite.event_id),notice:"#{favorite.event.title}をお気に入りしました"
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    redirect_to event_path(params[:id]), notice:"#{favorite.event.title}のお気に入りを解除しました"
  end
end
