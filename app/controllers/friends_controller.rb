class FriendsController < ApplicationController

  def index
    user = User.find_by_uiid(params[:uiid])
    render :json => user.friends
  end

  def send_friend_request
    me = User.find_by_uiid(params[:my_uiid])
    requested_user = User.find_by_uiid(params[:to_user_uiid])
    if me != nil && requested_user != nil && params[:my_uiid] != params[:to_user_uiid]
      req = FriendRequest.find_by_user_id_and_requested_user_id(me.id, requested_user.id)
      unless req
        requested = FriendRequest.find_by_user_id_and_requested_user_id(requested_user.id, me.id)
        if requested
          FriendRequest.delete(requested.id)
          Friendship.create(:user_id => me.id, :friend_id => requested_user.id)
          Friendship.create(:user_id => requested_user.id, :friend_id => me.id)
        else
          FriendRequest.create(:user_id => me.id, :requested_user_id => requested_user.id)
	end
      end
    end
  end

end
