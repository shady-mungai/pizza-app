class RestaurantsController < ApplicationController
    protect_from_forgery with: :null_session
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        restaurants = Restaurant.all
        render json: restaurants
    end
    
    def show
        restaurant = Restaurant.find(params[:id])
        restaurant
        render json: restaurant, include: :pizzas
    end

    def destroy
        restaurant = Restaurant.find_by(params[:id])
        restaurant.destroy
        head :no_content
    end

    private

    def render_not_found_response
      render json: { error: "Restaurant not found" }, status: :not_found
    end
    
end
