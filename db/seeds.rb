time = Time.new

unless User.exists?(email: 'admin@qwew.ts')
  admin = User.new(
      email: 'admin@qwew.ts',
      password: '12345678',
      password_confirmation: '12345678',
      role: 'admin',
      confirmed_at: time
    )
  admin.name = Faker::Name.first_name
  admin.last_name = Faker::Name.last_name
  admin.phone = Faker::PhoneNumber.cell_phone
  admin.profile.avatar = Faker::Avatar.image
  admin.save
end

emails = []
15.times do |i|
  emails.push(Faker::Internet.email)
end
emails.each do |email|
  unless User.exists?(email: email)
    user = User.new(
        email: email,
        password: '12345678',
        password_confirmation: '12345678',
        confirmed_at: time
      )
    user.name = Faker::Name.first_name
    user.last_name = Faker::Name.last_name
    user.phone = Faker::PhoneNumber.cell_phone
    user.avatar = Faker::Avatar.image
    user.save
  end
end
15.times do |i|
  article = Article.new()
  article.user_id =  Faker::Number.between(1, 15)
  article.title = Faker::Book.title
  article.description = Faker::Lorem.paragraph(1, false, 2)
  article.full_text = Faker::Lorem.paragraphs(2)
  article.rating = Faker::Number.between(0, 20)
  article.visitors = Faker::Number.between(0, 10)
  article.hidden = Faker::Boolean.boolean(0.2)
  article.published = Faker::Boolean.boolean(0.6)
  article.save
end

# category_list = [ 'Sport', 'Economics', 'Politics', 'World',
#  'Auto', 'Society', 'Accidents', 'Peoples']

# category_list.each do |category|
#   Category.create( title: category )
# end


15.times do |tag|
  ActsAsTaggableOn::Tag.create( name: Faker::Lorem.word )
end
15.times do |tag|
  ActsAsTaggableOn::Tag.create( name: Faker::Hipster.word )
end
