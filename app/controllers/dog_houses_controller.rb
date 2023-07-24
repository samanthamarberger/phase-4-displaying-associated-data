class DogHousesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    reviews = Review.all.order(rating: :desc)
    render json: reviews, include: :dog_house
  end
  
  def show
    dog_house = DogHouse.find(params[:id])
    render json: dog_house, include: :reviews
  end

  private

  def render_not_found_response
    render json: { error: "Dog house not found" }, status: :not_found
  end

end
