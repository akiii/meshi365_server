class UsersController < ApplicationController

  def show

  end

  def signup
    json = {}
    user = User.new
    user.name = params[:name]
    user.uiid = params[:uiid]
    user.profile_image_file_name = params[:profile_image_file_name]
    
    if user.save
      json["user_id"] = user.id
      json["user_name"] = user.name
      json["user_uiid"] = user.uiid
      json["user_profile_image_file_name"] = user.profile_image_file_name
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
    me = User.find_by_uiid(params[:from_user_uiid])
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

  def search_friends
    current_user = User.find_by_uiid(params[:uiid])
    users = User.find(:all, :conditions => ['name like ?', params[:word] + '%'])

    users.delete current_user if users.include? current_user
    users.delete_if do |u|
      current_user.friends.include? u
    end
    render :json => users
  end

end
