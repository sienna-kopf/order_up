# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


chef = Chef.create!(name: "Gordon Ramsey")
grilled_cheese = chef.dishes.create!(name: "Grilled Cheese", description: "Toasted cheese filled sandwich")
cheese = grilled_cheese.ingredients.create!(name: "Sliced Cheese", calories: 250)
bread = grilled_cheese.ingredients.create!(name: "Brioche Bread", calories: 300)
