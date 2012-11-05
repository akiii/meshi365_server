class CreateRecommendStores < ActiveRecord::Migration
  def change
    create_table :recommend_stores do |t|
      t.integer :group_id
      t.string :name
      t.integer :average_star_num
      t.string :file_name

      t.timestamps
    end
  end
end
