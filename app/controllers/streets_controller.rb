class StreetsController < ApplicationController
  def index
    @streets = Street.all
  end

  def new
    @street = Street.new
  end

  def create
    @street = Street.new(street_params)

    @street.save
    redirect_to streets_path
  end

  private

  def street_params
    params.require(:street).permit(:name, :kind)
  end
end
