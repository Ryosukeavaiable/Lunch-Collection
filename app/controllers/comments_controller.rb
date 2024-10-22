class CommentsController < ApplicationController
  before_action :set_map, only: [:create, :destroy]  # マップを設定
  before_action :set_comment, only: [:destroy]       # コメントを設定

  def create
    @comment = @map.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to maps_path, notice: 'コメントが投稿されました。'
    else
      redirect_to maps_path, alert: 'コメントの投稿に失敗しました。'
    end
  end

  def destroy
    if @comment.user == current_user  # コメントの所有者のみが削除できる
      @comment.destroy
      redirect_to maps_path, notice: 'コメントが削除されました。'
    else
      redirect_to maps_path, alert: 'コメントの削除に失敗しました。'
    end
  end

  private

  def set_map
    @map = Map.find(params[:map_id])  # マップを取得
  end

  def set_comment
    @comment = @map.comments.find(params[:id])  # コメントを取得
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
