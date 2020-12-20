# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Subject.destroy_all
Appointment.destroy_all
UserSubject.destroy_all

u1 = User.create(name: "John Doe", email: "john@doe.com", password: "test")
u2 = User.create(name: "Smart Guy", email: "smart@guy.com", password: "test" , is_tutor: true)

s1 = Subject.create(name: "Math")
s2 = Subject.create(name: "English")

#:year, :month, :day, :hour, :min, :sec



appointment1 = Appointment.create(tutor: u2,  student: u1, date: DateTime.new(2020,12,23,18,0,0), subject: s1)
appointment2 = Appointment.create(tutor: u2, student: u2, date: DateTime.new(2021,10,10,15,30,0), subject: s2)

us1 = UserSubject.create(user: u1, subject: s1)
us2 = UserSubject.create(user: u1, subject: s2)
us3 = UserSubject.create(user: u2, subject: s1)