class RemoveIngredientsFromRestaurantPizzas < ActiveRecord::Migration[7.0]
  def change
    remove_column :restaurant_pizzas, :ingredients, :string
  end
end
