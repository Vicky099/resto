class Api::V1::RestaurantsController < Api::V1::BaseController
  respond_to :json
  def index
    @restaurants = Restaurant.all_restaurants
    respond_to do |format|
      format.json { render json: @restaurants }
    end
  end
end
