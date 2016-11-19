class FollowingsController < ApplicationController
  def create
  	followed_id = params[:followed_id]
  	current_user.followings.create(followed_id: followed_id )
  	redirect_to users_homepage_path
  end
end
