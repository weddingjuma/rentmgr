class RentObjectsController < ApplicationController
  def index
    @rent_objects = RentObject.all
  end

  def show
    @rent_object = RentObject.find(params[:id])
  end

  def new
    @rent_object = RentObject.new
  end

  def create
    @rent_object = RentObject.new(rent_object_params)

    @rent_object.save
    redirect_to @rent_object
  end

  private

  def rent_object_params
    params.require(:rent_object)
      .permit(:code,
              :area,
              :function,
              :comment,
              :house_number,
              :settlement_id,
              :street_id)
  end
end
