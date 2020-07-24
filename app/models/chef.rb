class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

#   def most_pop_ingredients
# #     SELECT ingredients.name FROM ingredients INNER JOIN dish_ingredients ON ingredients.id = dish_ingredients.ingredient_id JOIN dishes ON dish_ingredients.dish_id = dishes.id JOIN chefs ON dishes.chef_id = chefs.id
# # WHERE chefs.name = 'Gordon Ramsey' LIMIT 3;
#     Ingredients.select(:name).joins(:dish_ingredients).joins(:dishes).joins(:chefs).where('chefs.name = ?', 'Gordon Ramsey').limit(3)
#   end
end
