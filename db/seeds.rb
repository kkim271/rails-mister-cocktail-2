# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

image_file = URI.open('https://images.unsplash.com/photo-1574068929209-e42913591709?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60')

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)

ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

new_cocktail = Cocktail.new(name: "Gin & Tonic")
new_cocktail.photo.attach(io: image_file, filename: 'gintonic.jpeg', content_type: 'image/jpeg')
new_dose = Dose.new(description: "1 shot")
new_dose.ingredient = Ingredient.find(3)
new_dose.cocktail = new_cocktail
new_dose.save
new_cocktail.save
