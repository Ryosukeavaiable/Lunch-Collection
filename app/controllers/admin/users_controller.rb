class Admin::UsersController < ApplicationController
  
  before_action :authenticate_admin! # 管理者認証が必要

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  # 他の管理者向けアクションを追
  
end
