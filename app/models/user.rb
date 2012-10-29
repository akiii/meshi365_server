class User < ActiveRecord::Base
  attr_accessible :name, :uiid
  validates :uiid, :uniqueness => true
end
