class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(current_user.id)
    @posts = current_user.posts.order(created_at: :desc).page(params[:page]).per(10)
  end

  def followers
    @user = User.find(current_user.id)
  end
  
end
