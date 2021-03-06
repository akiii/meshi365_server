class FoodPicturesController < ApplicationController

  def index
    render :json => FoodPicture.all
  end

  def food_line
    user = User.find_by_uiid(params[:uiid])
    food_pictures = FoodPicture.order.paginate(:page => params[:page], :conditions => { :user_id => user.friends.map(&:id) << user.id }, :include => :user, :per_page => 30)
    render :json => food_pictures.to_json(:include => :user)
  end

  def calender
    current_user = User.find_by_uiid(params[:my_uiid])
    user = User.find_by_uiid(params[:uiid])
 
    since_date = Time.parse(params[:since_date])
    to_date = Time.parse(params[:to_date])

    food_pictures = []
    if (current_user == user) || (current_user.friends.include? user)
      uid = user.friends.map(&:id) << user.id
      puts uid
      food_pictures = FoodPicture.order.paginate(:page => params[:page], :conditions => [ "user_id = ? and created_at >= ? and created_at <= ?", user.id, since_date, to_date ], :include => :user, :per_page => 30)
    end
    render :json => food_pictures.to_json(:include => :user)
  end

  def post
    picture = FoodPicture.new
    picture.user_id    = User.find_by_uiid(params[:uiid]).id
    picture.file_name  = params[:file_name]
    picture.meal_type  = params[:meal_type]
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
    picture.created_at = Time.parse(params[:created_at]) if params[:created_at]
    if picture.save
      render :json => { "save" => true }
    else
      render :json => { "save" => false }
    end
  end

end
