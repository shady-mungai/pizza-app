class RestaurantPizzasController < ApplicationController
    protect_from_forgery with: :null_session

    def create
        restaurant_pizzas = RestaurantPizza.create!(restaurant_pizzas_params)
        render json: restaurant_pizzas.pizza, status: :created
        rescue ActiveRecord::RecordInvalid => e
            render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    private
    def restaurant_pizzas_params
        params.permit(:price, :pizza_id,:restaurant_id)
    end
end
