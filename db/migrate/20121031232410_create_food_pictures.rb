class CreateFoodPictures < ActiveRecord::Migration
  def change
    create_table :food_pictures do |t|
      t.integer :user_id
      t.integer :type
      t.string :url
      t.string :store_name
      t.string :menu_name
      t.text :comment
      t.integer :star_num

      t.timestamps
    end
  end
end
