# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  MORE_FAMILIES = [
    {:size => 4, :location => 'Oakland', :surname => 'Fox'},
    {:size => 2, :location => 'Antioch', :surname => 'Dong'},
    {:size => 5, :location => 'Richmond', :surname => 'Hoang'},
    {:size => 3, :location => 'Antioch', :surname => 'Peng'},        
    {:size => 6, :location => 'Bay Point', :surname => 'Leung'},
    {:size => 3, :location => 'Oakland', :surname => 'Guo'}
  ]
  
  MORE_FAMILIES.each do |family|
    Family.create!(family)
  end
