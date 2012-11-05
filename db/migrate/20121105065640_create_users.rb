class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uiid
      t.string :name
      t.string :profile_image_file_name

      t.timestamps
    end
  end
end
