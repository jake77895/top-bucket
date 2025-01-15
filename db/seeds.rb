# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create forum rooms
ForumRoom.create(name: "General Discussion", description: "A place to talk about anything!")
ForumRoom.create(name: "Tech Talk", description: "Discuss the latest in technology.")
ForumRoom.create(name: "Help Desk", description: "Ask questions and get help.")

# Add dummy posts if the Post model is already created
if defined?(Post)
  ForumRoom.first.posts.create(title: "Welcome to the General Discussion", body: "Feel free to introduce yourself!", user_id: 1)
end

