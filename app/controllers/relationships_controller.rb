class RelationshipsController < ApplicationController
  before_action :set_user, only: %i[create destroy]
  def create
    current_user.follow(@user.id)
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(@user.id)
    redirect_to request.referer
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
