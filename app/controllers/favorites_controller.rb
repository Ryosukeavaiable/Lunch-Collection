class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_map

  def create
    @favorite = @map.favorites.new(user: current_user)

    if @favorite.save
      flash[:success] = 'お気に入りに追加しました！'
    else
      flash[:alert] = 'お気に入りに追加できませんでした。'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @favorite = @map.favorites.find_by(user: current_user)
    
    if @favorite
      @favorite.destroy
      flash[:success] = 'お気に入りを削除しました。'
    else
      flash[:alert] = 'お気に入りが見つかりません。'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def find_map
    @map = Map.find(params[:map_id])
  end
end