class FoodPicturesController < ApplicationController

  def index
    render :json => FoodPicture.all
  end

  def food_line
    user = User.find_by_uiid(params[:uiid])
    render :json => FoodPicture.order.paginate(:page => params[:page], :conditions => { :user_id => user.friends.map(&:id) << user.id }, :include => :user, :per_page => 30)
  end

  def post
    picture = FoodPicture.new
    picture.user_id    = User.find_by_uiid(params[:uiid]).id
    picture.meal_type  = params[:meal_type]
    picture.url        = params[:url]
    if params[:store_name]
      picture.store_name = params[:store_name]
    end
    if params[:menu_name]
      picture.menu_name  = params[:menu_name]
    end
    if params[:amenity]
      picture.amenity = params[:amenity]
    end
    if params[:comment]
      picture.comment    = params[:comment]
    end
    picture.star_num   = params[:star_num]
    if picture.save
      render :json => { "save" => true }
    else
      render :json => { "save" => false }
    end
  end

end
