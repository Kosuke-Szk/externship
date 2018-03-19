module UserHelper
  def user_name(user_id)
    User.find(user_id).fullname
  end
end
