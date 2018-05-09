# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
Cat.create!(name: "Drogo", sex: 'M', color: 'brown', birth_date: '2000-01-01')
Cat.create!(name: "Elsa", sex: 'F', color: 'white', birth_date: '2001-02-02')
Cat.create!(name: "Rango", sex: 'M', color: 'grey', birth_date: '2011-03-28')