# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Group.delete_all
Group.create(:amenity => 1, :max_parcentage => 100, :min_parcentage => 77)
Group.create(:amenity => 1, :max_parcentage =>  77, :min_parcentage => 55)
Group.create(:amenity => 1, :max_parcentage =>  55, :min_parcentage => 33)
Group.create(:amenity => 2, :max_parcentage => 100, :min_parcentage => 77)
Group.create(:amenity => 2, :max_parcentage =>  77, :min_parcentage => 55)
Group.create(:amenity => 2, :max_parcentage =>  55, :min_parcentage => 33)
Group.create(:amenity => 3, :max_parcentage => 100, :min_parcentage => 77)
Group.create(:amenity => 3, :max_parcentage =>  77, :min_parcentage => 55)
Group.create(:amenity => 3, :max_parcentage =>  55, :min_parcentage => 33)
