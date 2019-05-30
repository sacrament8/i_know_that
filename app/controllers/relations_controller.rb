class RelationsController < ApplicationController
  before_action :authenticate_user!

  def create
    if user_signed_in?
      @user = User.find(params[:relation][:followed_id])
      redirect_to followers_user_path(current_user) if already_linked?(current_user, @user)
      current_user.follow!(@user)
      redirect_to followers_user_path(current_user.id), notice: "#{@user.name}さんとひそひそ状態になりました"
    end  
  end

  def destroy
    @relation = Relation.find(params[:id])
    # current_user がフォローした側
    if @relation.follower_id == current_user.id
      @user = @relation.followed
      current_user.unfollow!(@user)
    # current_userがフォローさせている側
    elsif @relation.followed_id == current_user.id
      @user = @relation.follower
      @user.unfollow!(current_user)
    end
    redirect_to followers_user_path(current_user.id), notice: "#{@user.name}さんとのひそひそ状態を解除しました"
  end
end
