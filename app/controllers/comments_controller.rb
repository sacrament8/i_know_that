class CommentsController < ApplicationController
  before_action :authenticate_user!, except: %i(create)
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(params[:post_id])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :content, :post_id)
  end
end
