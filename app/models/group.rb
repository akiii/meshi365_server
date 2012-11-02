class Group < ActiveRecord::Base
  attr_accessible :amenity, :max_parcentage, :min_parcentage

  has_many :group_relationships, :dependent => :destroy
  has_many :users, :through => :group_relationships
end
