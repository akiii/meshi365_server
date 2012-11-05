class CreateRecommendStores < ActiveRecord::Migration
  def change
    create_table :recommend_stores do |t|
      t.integer :group_id
      t.string :name
      t.float :average_star_num
      t.string :url

      t.timestamps
    end
  end
end
