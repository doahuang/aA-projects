# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


a = User.create!(username: 'Mary')
b = User.create!(username: 'Fred')
c = User.create!(username: 'Mike')
d = User.create!(username: 'John')


Poll.create!(title: 'poll 1', user_id: a.id)

Question.create!(body: 'who\'s there?', poll_id: 1)
Question.create!(body: 'how are you?', poll_id: 1)
Question.create!(body: 'what time is it?', poll_id: 1)

AnswerChoice.create!(body: 'nobody.', question_id: 1)
AnswerChoice.create!(body: 'police.', question_id: 1)

AnswerChoice.create!(body: 'i\'m fine', question_id: 2)
AnswerChoice.create!(body: 'too bad', question_id: 2)
AnswerChoice.create!(body: '6 am.', question_id: 3)
AnswerChoice.create!(body: '12 pm.', question_id: 3)

Poll.create!(title: 'final poll', user_id: b.id)

Question.create!(body: 'do you smoke?', poll_id: 2)
Question.create!(body: 'do you drink?', poll_id: 2)

AnswerChoice.create!(body: 'yes', question_id: 4)
AnswerChoice.create!(body: 'no', question_id: 4)
AnswerChoice.create!(body: 'yes', question_id: 5)
AnswerChoice.create!(body: 'sure', question_id: 5)

Response.create!(user_id: c.id, answer_choice_id:1)
Response.create!(user_id: b.id, answer_choice_id:2)

Response.create!(user_id: c.id, answer_choice_id:4)
Response.create!(user_id: c.id, answer_choice_id:5)
Response.create!(user_id: d.id, answer_choice_id:7)
Response.create!(user_id: d.id, answer_choice_id:10)
