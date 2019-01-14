class RelationshipsController < ApplicationController
  # before_action :logged_in_user

  def create
    @user = User.find params[:followed_id]
    current_user.follow @user
    current_user.activities.create(
      object_id: @user.id,
      action_type: :follow
    )
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow @user
    current_user.activities.create(
      object_id: @user.id,
      action_type: :unfollow
    )
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
