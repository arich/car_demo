class Api::CarsController < ApplicationController
  def create
    Car.create!(car_params)
    head :ok
  end

  def index
    render json: Car.all
  end

  private

  def car_params
    params.require(:car).permit(
      %i[
        name
        brand_id
      ]
    )
  end
end
