class UsersController < ApplicationController

   before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
   before_action :correct_user, only: [:edit, :update]

   def correct_user
    @user = User.find(params[:id])
    redirect_to mypage_user_path(current_user), alert: "不正なアクセスです。" unless @user == current_user
   end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "退会が完了しました。ご利用ありがとうございました。"
    redirect_to new_user_registration_path
  end

  def mypage
    @user = current_user
    @maps = @user.maps
  end

  def show
    @user = User.find(params[:id])
    @maps = @user.maps
  end

  def edit
    @user = User.find(params[:id])
    unless @user = current_user
    redirect_to mypage_user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to mypage_user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end

end
