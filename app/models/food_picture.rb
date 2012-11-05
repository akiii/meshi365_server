class FoodPicture < ActiveRecord::Base
  attr_accessible :amenity, :comment, :created_at, :file_name, :meal_type, :menu_name, :star_num, :store_name, :user_id

  belongs_to :user

  scope :order, :order => "food_pictures.created_at desc"
end
