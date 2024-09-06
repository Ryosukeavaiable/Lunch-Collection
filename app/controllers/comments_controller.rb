class CommentsController < ApplicationController
   def create
    @map = Map.find(params[:map_id])
    @comment = @map.comments.build(comment_params)

    if @comment.save
      redirect_to maps_path, notice: 'コメントが投稿されました。'
    else
      redirect_to maps_path, alert: 'コメントの投稿に失敗しました。'
    end
   end

  def destroy
    @map = Map.find(params[:map_id])
    @comment = @map.comments.find(params[:id])
    @comment.destroy
    redirect_to maps_path, notice: 'コメントが削除されました。'
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :map_id)
  end

end
