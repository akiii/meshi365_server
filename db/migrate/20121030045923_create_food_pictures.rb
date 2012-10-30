class CreateFoodPictures < ActiveRecord::Migration
  def change
    create_table :food_pictures do |t|
      t.integer :user_id
      t.text :url
      t.text :store_name
      t.text :menu_name
      t.integer :star_num

      t.timestamps
    end
  end
end
