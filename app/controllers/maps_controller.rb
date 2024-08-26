class MapsController < ApplicationController
 before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
 before_action :correct_map, only: [:edit, :update]
 
 def correct_map
    @map = Map.find(params[:id])
    redirect_to mypage_user_path(current_user), alert: "不正なアクセスです。" unless @map.user == current_user
 end

  def new
  @map = Map.new
  end

  def create
    @map = Map.new(map_params)
    @map.user_id = current_user.id
    if @map.save
      redirect_to maps_path, notice: 'マップが作成されました。'
    else
      render :new
    end
  end


  def index
    @maps = Map.all
  end


  def show
    @map = Map.find(params[:id])
  end

  def edit
    @map = Map.find(params[:id])
  end


  def update
    @map = Map.find(params[:id])
    if @map.update(map_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to mypage_user_path(current_user)
    else
    render :edit
    end
  end


  def destroy
    map = Map.find(params[:id])
    map.delete mypage_user_path(current_user)
    redirect_to
  end

  private

  def map_params
      params.require(:map).permit(:address, :latitude, :longitude, :body, :title, :photo )
  end
end