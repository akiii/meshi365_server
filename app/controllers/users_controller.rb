class UsersController < ApplicationController

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

end
