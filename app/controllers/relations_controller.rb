class RelationsController < ApplicationController
  before_action :authenticate_user!

  def create
    if user_signed_in?
      @user = User.find(params[:relation][:followed_id])
      current_user.follow!(@user)
      redirect_to followers_user_path(current_user.id), notice: "#{@user.name}さんをひそひそ登録しました"

    end  
  end

  def destroy
    @user = Relation.find(params[:id]).followed
    current_user.unfollow!(@user)
    redirect_to followers_user_path(current_user.id), notice: "#{@user.name}さんとのひそひそを解除しました"
  end
end
