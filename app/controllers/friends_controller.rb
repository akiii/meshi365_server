class FriendsController < ApplicationController

  def index
    user = User.find_by_uiid(params[:uiid])
    render :json => user.friends
  end

  def send_friend_request
    me = User.find_by_uiid(params[:my_uiid])
    request_user = User.find_by_uiid(params[:to_user_uiid])
    if me != nil && request_user != nil && params[:my_uiid] != params[:to_user_uiid]
      req = FriendRequest.find_by_user_id_and_requested_user_id(me.id, request_user.id)
      if req
        FriendRequest.delete(req.id)
        Friendship.create(:user_id => me.id, :friend_id => request_user.id)
        Friendship.create(:user_id => request_user.id, :friend_id => me.id)
      else
        unless FriendRequest.exists?(:user_id => request_user.id, :requested_user_id => me.id)
          FriendRequest.create(:user_id => request_user.id, :requested_user_id => me.id)
        end
      end
    end
  end

end
