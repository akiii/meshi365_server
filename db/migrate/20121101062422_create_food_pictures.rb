class CreateFoodPictures < ActiveRecord::Migration
  def change
    create_table :food_pictures do |t|
      t.integer :user_id
      t.string :url
      t.integer :meal_type
      t.string :store_name
      t.string :menu_name
      t.string :comment
      t.integer :star_num

      t.timestamps
    end
  end
end
