class UsersController < ApplicationController

  def show

  end

  def signup
#    puts params[:profile_image_url]
    json = {}
    user = User.new
    user.name = params[:name]
    user.uiid = params[:uiid]
#    user.profile_image_url = params[:profile_image_url]
    
    if user.save
      json["user_id"] = user.id
      json["user_name"] = user.name
      json["user_uiid"] = user.uiid
#      json["user_profile_image_url"] = user.profile_image_url
      json["save"] = true
    else
      json["save"] = false
    end
    render :json => json
  end

  def login
    puts params[:uiid]
    json = {}
    user = User.find_by_uiid(params[:uiid])
    if user
      json["user_id"] = user.id
    else
      json = {}
      user = User.new
      user.uiid = params[:uiid]
      if user.save
        json["save"] = true
      else
        json["save"] = false
      end
      json["user_id"] = User.find_by_uiid(params[:uiid]).id
    end
    json["uiid"] = user.uiid
    render :json => json
  end

  def me
    user = User.find_by_uiid(params[:uiid])
    render :json => user
  end

  def friends
    user = User.find_by_uiid(params[:uiid])
    render :json => user.friends
  end

  def requesting_users
    user = User.find_by_uiid(params[:uiid])
    render :json => user.requesting_users
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
