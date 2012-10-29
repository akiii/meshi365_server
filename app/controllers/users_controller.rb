class UsersController < ApplicationController

  def login
    puts "loginnnnnnn"
    puts params[:uiid]
    render :json => { "status" => "ok" }
  end

end
