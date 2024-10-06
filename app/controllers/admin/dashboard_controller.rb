class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin! # 管理者認証が必要
  def index
  end
end
