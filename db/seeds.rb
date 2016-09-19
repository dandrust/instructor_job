# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

JobListing.create!(company_name: "Harmony",
                   course: "BLS",
                   location: "Grandrapidshire",
                   class_date: Date.new(2016, 12, 1),
                   class_time: DateTime.new(2016, 12, 1, 2, 3, 4),
                   number_of_students: 20,
                   rate: 20.00,
                   description: "Teach BLS to bar staff at Harmony",
                   needs_equipment: true,
                   needs_insurance: false)
