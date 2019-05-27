class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i()
  before_action :set_post, only: %i(edit show update destroy)

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
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

  # def update
  # end

  # def destroy
  # end
  
  private

  def set_post
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :image, :status)
  end
end
