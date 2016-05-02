# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

time = Time.new

User.create(name: 'Admin', email: 'admin@qwew.ts', password: '12345678', confirmed_at: time)

5.times do |i|
  Article.create(title: "Article ##{i}", description: "An article.", user_id: 1)
end

category_list = [ 'Sport', 'Economics', 'Politics', 'World',
 'Auto', 'Society', 'Accidents', 'Peoples']

category_list.each do |category|
  Category.create( title: category )
end

5.times do |i|
  User.create(name: "User ##{i}", password: "user#{i}.", email: "User ##{i}")
end

tag_list = [ 'Lena', 'cat', 'pizza', 'home', '2016', 'corn',
'ruby', 'asd', 'tag1', 'lol', 'Putin', 'football', 'master' ]

tag_list.each do |tag|
  ActsAsTaggableOn::Tag.create( name: tag )
end
