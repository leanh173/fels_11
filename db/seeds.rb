# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
(1..100).each do |i| 
  Question.create(word: "Word#{i}", content: "description#{i}", category_id: i%10)
  Answer.create(content: "Option#{i}", question_id: i, right_answer: true)
  (1..3).each do |j|
  	Answer.create(content: "Option#{i+j*100}", question_id: i , right_answer: false)
  end
end
(1..10).each do |i|
	Category.create(name_course: "Course#{i}")
end
