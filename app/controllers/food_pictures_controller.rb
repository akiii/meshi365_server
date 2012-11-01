class FoodPicturesController < ApplicationController

  def index
    pictures = FoodPicture.all
    render :json => pictures
  end

  def post
    picture = FoodPicture.new
    picture.user_id    = User.find_by_uiid(params[:uiid]).id
    picture.type       = params[:meal_type]
    picture.url        = params[:url]
    if params[:store_name]
      picture.store_name = params[:store_name]
    end
    if params[:menu_name]
      picture.menu_name  = params[:menu_name]
    end
    if params[:comment]
      picture.comment    = params[:comment]
    end
    picture.star_num   = params[:star_num]
    picture.save
    if picture.save
      render :json => { "save" => true }
    else
      render :json => { "save" => false }
    end
  end

end
