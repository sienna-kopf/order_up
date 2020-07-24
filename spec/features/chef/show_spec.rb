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
    @macncheese = @chef.dishes.create!(name: "Mac n'Cheese", description: "Cheesy Noodles")
    @noodles = @macncheese.ingredients.create!(name: "Macaroni Noodles", calories: 200)
    @fries = @chef.dishes.create!(name: "Fries", description: "Crispy Fried Potatoes")
    @potato = @fries.ingredients.create!(name: "Potato", calories: 350)
    @chicken_parm = @chef.dishes.create!(name: "Chicken Parmesan", description: "Baked Chicken Breaded with Parmesan Cheese")
    @parmesan = @chicken_parm.ingredients.create!(name: "Parmesan Cheese", calories: 100)
    @sesame_chicken = @chef.dishes.create!(name: "Sesame Chicken", description: "Chicken flavored with Soy Glaze and coated with sesame seeds")
    @sesame = @sesame_chicken.ingredients.create!(name: "Sesame Seeds", calories: 10)
    @soy_sauce = @sesame_chicken.ingredients.create!(name: "Soy Sauce", calories: 50)

    @sesame_chicken.add_ingredient(@chicken)
    @chicken_parm.add_ingredient(@chicken)
    @macncheese.add_ingredient(@chicken)
    @fries.add_ingredient(@ketchup)
    @macncheese.add_ingredient(@cheese)
    @fries.add_ingredient(@cheese)
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
      expect(page).to have_content("Macaroni Noodles")
      expect(page).to have_content("Parmesan Cheese")
      expect(page).to have_content("Potato")
      expect(page).to have_content("Sesame Seeds")
      expect(page).to have_content("Soy Sauce")
    end
  end

  xit "displays 3 most popular ingredients for that chef" do
    visit "/chefs/#{@chef.id}"

    within(".most_pop_ingredients") do
      expect(page.all('li')[0]).to have_content("Chicken")
      expect(page.all('li')[1]).to have_content("Sliced Cheese")
      expect(page.all('li')[2]).to have_content("Ketchup")
    end
  end
end
