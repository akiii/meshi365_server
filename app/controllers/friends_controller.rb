class FriendsController < ApplicationController

  def index
    friends = Friend.find_all_by_my_id(params[:id])
    render :json => friends
  end

end
