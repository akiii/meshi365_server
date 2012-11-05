class CreateFoodPictures < ActiveRecord::Migration
  def change
    create_table :food_pictures do |t|
      t.integer :user_id
      t.string :file_name
      t.integer :meal_type
      t.string :store_name
      t.string :menu_name
      t.integer :star_num
      t.text :comment
      t.integer :amenity
      t.timestamps :created_at

      t.timestamps
    end
  end
end
