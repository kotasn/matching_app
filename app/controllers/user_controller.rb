class UserController < ApplicationController
  def index
    @users = User.all
  end

  def show

  end

  def follow_list
    @follow_list = current_user.get_follow_list
    @followers_list = current_user.get_followers_list
    @match_list = current_user.matching
  end

end
