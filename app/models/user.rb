class User < ActiveRecord::Base
  attr_accessible :name, :uiid
  validates :uiid, :uniqueness => true, :allow_nil => false

  has_many :friendships, :dependent => :destroy
  has_many :friends, :through => :friendships
end
