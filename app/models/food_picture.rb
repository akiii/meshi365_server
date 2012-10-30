class FoodPicture < ActiveRecord::Base
  attr_accessible :menu_name, :star_num, :store_name, :url, :user_id
end
