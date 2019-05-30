module UsersHelper

  # 自分がフォローするユーザー、自分をフォローしているユーザーのidを配列で取得
  def get_followers_and_followings_ids(sign_in_user)
    followings_ids = sign_in_user.following.pluck(:id)
    followers_ids = sign_in_user.followers.pluck(:id)
    followers_and_followings_ids = (followings_ids + followers_ids).uniq
  end

  # 自分がフォローするユーザー、自分をフォローしているユーザーのインスタンスを配列で取得
  def followers_and_followings(sign_in_user)
    followers_and_followings = User.where(id: get_followers_and_followings_ids(sign_in_user))
  end

  # 自分が相手を、または相手が自分をフォローしていればtrueをそうでなければfaleを返す
  def already_linked?(sign_in_user, other_user)
    get_followers_and_followings_ids(sign_in_user).include?(other_user.id)
  end

end
