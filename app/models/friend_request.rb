class FriendRequest < ActiveRecord::Base
  attr_accessible :requested_user_id, :user_id
  belongs_to :user
  belongs_to :requested_user, :class_name => 'User', :foreign_key => :requested_user_id
end
