class FoodPicture < ActiveRecord::Base
  attr_accessible :amenity, :comment, :meal_type, :menu_name, :star_num, :store_name, :url, :user_id
end
