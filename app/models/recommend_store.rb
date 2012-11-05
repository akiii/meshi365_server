class RecommendStore < ActiveRecord::Base
  attr_accessible :average_star_num, :file_name, :group_id, :name
end
