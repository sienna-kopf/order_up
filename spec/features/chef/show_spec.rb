require 'rails_helper'

RSpec.describe "chef show page" do
  before :each do
    @chef = Chef.create!(name: "Gordon Ramsey")
    @grilled_cheese = @chef.dishes.create!(name: "Grilled Cheese", description: "Toasted cheese filled sandwich")
    @cheese = @grilled_cheese.ingredients.create!(name: "Sliced Cheese", calories: 250)
    @bread = @grilled_cheese.ingredients.create!(name: "Brioche Bread", calories: 300)
    @chicken_nuggets = @chef.dishes.create!(name: "Chicken Nuggets", description: "Breaded Fried Chicken Pieces")
    @chicken = @chicken_nuggets.ingredients.create!(name: "Chicken", calories: 150)
    @ketchup = @chicken_nuggets.ingredients.create!(name: "Ketchup", calories: 30)
  end

  it "can see name of chef and link to view all ingredients" do
    visit "/chefs/#{@chef.id}"

    expect(page).to have_content("Gordon Ramsey")

    expect(page).to have_link("All Ingredients")
  end

  it "can click on link to see all unique ingredients a chef uses in their dishes" do
    visit "/chefs/#{@chef.id}"

    click_link "All Ingredients"

    expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")

    within(".chefs_ingredients") do
      expect(page).to have_content("Sliced Cheese")
      expect(page).to have_content("Brioche Bread")
      expect(page).to have_content("Chicken")
      expect(page).to have_content("Ketchup")
    end
  end
end
