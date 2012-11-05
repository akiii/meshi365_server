class AmenityGroup
  attr_accessor :id, :parcentage

  def self.create(params)
    group = AmenityGroup.new
    group.id = params[:id]
    group.parcentage = params[:parcentage]
    return group
  end

end
