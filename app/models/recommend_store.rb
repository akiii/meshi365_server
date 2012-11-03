class RecommendStore < ActiveRecord::Base
  attr_accessible :average_star_num, :group_id, :name, :url
end
