class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.integer :my_id
      t.integer :from_user_id

      t.timestamps
    end
  end
end
