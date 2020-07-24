# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@chef = Chef.create!(name: "Gordon Ramsey")

@chicken_nuggets = @chef.dishes.create!(name: "Chicken Nuggets", description: "Breaded Fried Chicken Pieces")
@chicken = @chicken_nuggets.ingredients.create!(name: "Chicken", calories: 150)
@sesame_chicken = @chef.dishes.create!(name: "Sesame Chicken", description: "Chicken flavored with Soy Glaze and coated with sesame seeds")
@sesame = @sesame_chicken.ingredients.create!(name: "Sesame Seeds", calories: 10)
@soy_sauce = @sesame_chicken.ingredients.create!(name: "Soy Sauce", calories: 50)
@chicken_parm = @chef.dishes.create!(name: "Chicken Parmesan", description: "Baked Chicken Breaded with Parmesan Cheese")

@sesame_chicken.add_ingredient(@chicken)
@chicken_nuggets.add_ingredient(@soy_sauce)
@chicken_parm.add_ingredient(@chicken)
