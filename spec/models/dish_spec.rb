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
      @grilled_cheese = @chef.dishes.create!(name: "Grilled Cheese", description: "Toasted cheese filled sandwich")
      @cheese = @grilled_cheese.ingredients.create!(name: "Sliced Cheese", calories: 250)
      @bread = @grilled_cheese.ingredients.create!(name: "Brioche Bread", calories: 300)
    end

    it "#total_calories" do
      expect(@grilled_cheese.total_calories).to eq(550)
    end
  end
end
