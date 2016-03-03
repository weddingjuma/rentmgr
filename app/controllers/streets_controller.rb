class StreetsController < ApplicationController
  def index
    @streets = Street.all
  end

  def edit
    @street = Street.find(params[:id])
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
    @street = Street.find(params[:id])

    if @street.update(street_params)
      redirect_to streets_path
    else
      render 'edit'
    end
  end

  def destroy
    @street = Street.find(params[:id])
    @street.destroy

    redirect_to streets_path
  end

  private

  def street_params
    params.require(:street).permit(:name, :kind)
  end
end
