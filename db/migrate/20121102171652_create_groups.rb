class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :amenity
      t.float :max_parcentage
      t.float :min_parcentage

      t.timestamps
    end
  end
end
