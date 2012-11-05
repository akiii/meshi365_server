class User < ActiveRecord::Base
  attr_accessible :name, :profile_image_file_name, :uiid

  validates :uiid, :uniqueness => true, :allow_nil => false

  # friend関係
  has_many :friendships, :dependent => :destroy
  has_many :friends, :through => :friendships

  # friend request関係
  has_many :friend_requests, :dependent => :destroy
  has_many :requests, :class_name => 'FriendRequest', :foreign_key => :requested_user_id
  has_many :requesting_users, :through => :requests, :source => :user

  has_many :food_pictures
end
