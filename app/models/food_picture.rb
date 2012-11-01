class FoodPicture < ActiveRecord::Base
  attr_accessible :comment, :menu_name, :star_num, :store_name, :type, :url, :user_id
end
