# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.create(question:"What is your fave color?")
Question.create(question:"Do you live in Brooklyn?")
Tag.create(skill_tag: "Rails")
Tag.create(skill_tag: "Python")
Tag.create(skill_tag: "Javascript")
100.times do 
	@alum = User.create(email: Faker::Internet.email, password: "password",created_at: Time.now, first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, type:"Alum")
	Profile.create(headline: Faker::Book.title, bio: Faker::Hacker.say_something_smart, user_id: @alum.id)

	2.times do
	ResumeItem.create(title: Faker::University.name, heading: Faker::App.name, description: Faker::Hacker.say_something_smart, user_id: @alum.id, kind:"School")
	end

	Qna.create(question_id: 1, user_id: @alum.id, response: Faker::Hacker.say_something_smart)
	Qna.create(question_id: 2, user_id: @alum.id, response: Faker::Hacker.say_something_smart)

	Usertag.create(user_id: @alum.id, tag_id: 1)
	Usertag.create(user_id: @alum.id, tag_id: 2)
end

Profile.update_all(view_count:0)