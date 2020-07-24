require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}

    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "methods" do
    before :each do
      @chef = Chef.create!(name: "Gordon Ramsey")

      @chicken_nuggets = @chef.dishes.create!(name: "Chicken Nuggets", description: "Breaded Fried Chicken Pieces")
      @chicken = @chicken_nuggets.ingredients.create!(name: "Chicken", calories: 150)
      @sesame_chicken = @chef.dishes.create!(name: "Sesame Chicken", description: "Chicken flavored with Soy Glaze and coated with sesame seeds")
      @sesame = @sesame_chicken.ingredients.create!(name: "Sesame Seeds", calories: 10)
      @soy_sauce = @sesame_chicken.ingredients.create!(name: "Soy Sauce", calories: 50)
    end

    it "#add_ingredient" do
      expect(@sesame_chicken.ingredients).to eq([@sesame, @soy_sauce])

      @sesame_chicken.add_ingredient(@chicken)
      expect(@sesame_chicken.ingredients).to eq([@sesame, @soy_sauce, @chicken])
    end

    it "#total_calories" do
      @sesame_chicken.add_ingredient(@chicken)
      expect(@sesame_chicken.total_calories).to eq(210)
    end
  end
end
