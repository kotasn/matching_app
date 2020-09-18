class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      flash[:success] = 'フォローしました'
      redirect_to user_index_url
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to user_index_url
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:warn] = 'フォローを解除しました'
      redirect_to user_index_url
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to user_index_url
    end
  end

  private
  
  def set_user
    # @user = User.find(params[:relationship][:follow_id])
    @user = User.find(params[:follow_id])
  end
end
