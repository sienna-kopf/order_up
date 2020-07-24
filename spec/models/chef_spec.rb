require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "methods" do
    before :each do
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
    end

    xit "#most_pop_ingredients" do
      expect(@chef.most_pop_ingredients).to eq([@chicken, @soy_sauce, @sesame])
    end
  end
end
