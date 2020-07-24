require 'rails_helper'

RSpec.describe "dish show page" do
  before :each do
    @chef = Chef.create!(name: "Gordon Ramsey")
    @grilled_cheese = @chef.dishes.create!(name: "Grilled Cheese", description: "Toasted cheese filled sandwich")
    @cheese = @grilled_cheese.ingredients.create!(name: "Sliced Cheese", calories: 250)
    @bread = @grilled_cheese.ingredients.create!(name: "Brioche Bread", calories: 300)
  end

  it "can see a list of ingredients for the dish and the chefs name" do
    visit "/dishes/#{@grilled_cheese.id}"

    expect(page).to have_content("Chef: Gordon Ramsey")

    within(".dish_ingredients") do
      expect(page).to have_content("Sliced Cheese")
      expect(page).to have_content("Brioche Bread")
    end
  end

  it "can see the total calorie count for the dish" do
    visit "/dishes/#{@grilled_cheese.id}"

    expect(page).to have_content("Total Calories: 550")
  end 
end
