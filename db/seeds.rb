User.create!(name:  "Example User",
             email: "admin@a.org",
             password: "123456",
             admin:true
)

10.times do |n|
  category = Category.create(name: "Category #{n+1}")
end

10.times do |n|
User.create!(name:  "User#{n+1}",
             email: "nguyenvana#{n+1}@gmail.com",
             password:              "123456",
             password_confirmation: "123456")
end

15.times do |n|
  name  = "Lesson #{n+1}"
  status = "finished"
  category_id = Category.first.id
  user_id = User.first.id
  Lesson.create!(name: name,
              status: status,
              category_id: category_id,
              user_id: user_id)
end

30.times do |n|
  name = "word #{n+1}"
  learned = [true, false].sample
  category_id = Category.first.id
  Word.create!(name: name,
              learned: learned,
              category_id: category_id,
              answers_attributes:[
                {name: "word #{n+1}_ans1", is_correct: true},
                {name: "word #{n+1}_ans2", is_correct: false},
                {name: "word #{n+1}_ans3", is_correct: false},
                {name: "word #{n+1}_ans4", is_correct: false},
                {name: "word #{n+1}_ans5", is_correct: false}
                ])
end

15.times do |n|
  name  = "lession #{n+1}",
  category_id = Category.first.id
  user_id = User.first.id
  Lesson.create!(name: name,
              category_id: category_id,
              user_id: user_id,
              lesson_words_attributes:[
                {word_id:1},
                {word_id:2},
                {word_id:3},
                {word_id:4},
                {word_id:5}
                ])
end

users = User.all
user = users.first
following = users[2..20]
followers = users[3..30]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
