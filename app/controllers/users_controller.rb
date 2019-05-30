class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(current_user.id)
  end

  def followers
    @user = User.find(current_user.id)
  end

  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
end
