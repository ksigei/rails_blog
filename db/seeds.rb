require 'faker'
# LoadError: cannot load such file -- faker 
# => gem install faker



# User.create!(name: "Example User",
#                 bio: "I'm an example user. I'm here to show you how this app works.",
#                 photo: "https://i.imgur.com/4ZQ3Z0M.jpg")

# Generate a bunch of additional users
20.times do |n|
    name = Faker::Name.name
    bio = Faker::Lorem.sentence(word_count: 5)
    photo = Faker::LoremFlickr.image(size: "50x50", search_terms: ['people'])
    User.create!(name: name,
                    bio: bio,
                    photo: photo)
    end

# Generate posts for a subset of users

users = User.order(:created_at).take(20)
50.times do
    title = Faker::Lorem.sentence(word_count: 3)
    text = Faker::Lorem.sentence(word_count: 5)
    users.each { |user| user.posts.create!(title: title, text: text) }
end

posts = Post.order(:created_at).take(50)
5.times do
    text = Faker::Lorem.sentence(word_count: 5)
    user = users.sample
    posts.each { |post| post.comments.create!(user: user, text: text) }
end

posts = Post.order(:created_at).take(50)
20.times do
    like = [true, false].sample
    user = users.sample
    posts.each { |post| post.likes.create!(user: user, like: like) }
end

