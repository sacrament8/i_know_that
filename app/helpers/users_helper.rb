module UsersHelper
  def followers_and_followings(sign_in_user)
    # followersのid配列取得、followingのid配列を取得
    # 配列をpushで結合、uniq!で重複削除
    # 配列のidからUser.find_byでユーザーインスタンスの配列取得
    # viewでeachで回す
    followings_ids = sign_in_user.following.pluck(:id)
    followers_ids = sign_in_user.followers.pluck(:id)
    followers_and_followings_ids = (followings_ids + followers_ids).uniq
    @followers_and_followings = User.where(id: followers_and_followings_ids)
  end
end
