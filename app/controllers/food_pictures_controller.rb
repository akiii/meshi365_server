class FoodPicturesController < ApplicationController

  def index
    pictures = FoodPicture.find(1)
    render :json => pictures.image
  end

  def post
    picture = FoodPicture.new
    picture.user_id    = params[:user_id]
    picture.url        = params[:url]
    picture.store_name = params[:store_name]
    picture.menu_name  = params[:menu_name]
    picture.star_num   = params[:star_num]
    picture.save
  end

end
