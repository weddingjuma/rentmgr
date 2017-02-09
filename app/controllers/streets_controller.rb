class StreetsController < ApplicationController
  before_action :set_street, only: [:edit, :update, :destroy]

  def index
    @streets = Street.all
  end

  def edit
  end

  def new
    @street = Street.new
  end

  def create
    @street = Street.new(street_params)

    if @street.save
      redirect_to streets_path
    else
      render 'new'
    end
  end

  def update
    if @street.update(street_params)
      redirect_to streets_path
    else
      render 'edit'
    end
  end

  def destroy
    @street.destroy

    redirect_to streets_path
  end

  private

  def set_street
    @street = Street.find(params[:id])
  end

  def street_params
    params.require(:street).permit(:name, :kind)
  end
end
