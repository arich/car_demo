class Api::BrandsController < ApplicationController
  def create
    Brand.create!(brand_params)
    head :ok
  end

  def index
    render json: Brand.all
  end

  private

  def brand_params
    params.require(:brand).permit(
      %i[
        name
      ]
    )
  end
end
