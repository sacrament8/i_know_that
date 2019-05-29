class CommentsController < ApplicationController
  before_action :authenticate_user!, except: %i(create)

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      @post = Post.find(params[:post_id])
      @comments = @post.comments
      render template: "posts/show"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.comments.find(params[:id]).destroy
    redirect_to post_path(@post), notice: "コメントを削除しました"
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @post, notice: "コメントを編集しました"
    else
      render :edit
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :content, :post_id)
  end
end
