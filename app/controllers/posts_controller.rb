class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i(edit update destroy status_update)
  before_action :set_post, only: %i(edit show update destroy status_update)

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(9)
  end

  def show
    @comments = @post.comments
    @comment = @post.comments.build
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "質問に成功しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: '編集に成功しました'
    else
      render :edit
    end
  end

  def status_update
    if @post.update(status: post_params[:status])
      redirect_to @post, notice: '解決状態を更新しました'
    else
      render :show
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "質問の削除に成功しました"
  end
  
  private

  def set_post
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :image, :status)
  end
end
