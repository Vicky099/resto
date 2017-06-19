class Api::V1::RestaurantsController < Api::V1::BaseController
  respond_to :json
  def index
    @restaurants = Restaurant.all_restaurants
    respond_to do |format|
      format.json { render json: @restaurants.to_json(only: [:name ,:review_count ,:latitude,:longitude, :city, :state, :zip, :avg_rating ])}
    end
  end
end
