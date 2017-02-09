class RentObjectsController < ApplicationController
  before_action :set_rent_object, only: [:show, :edit, :update, :destroy]

  def index
    @rent_objects = RentObject.all.includes(:street)
  end

  def show
  end

  def edit
  end

  def new
    @rent_object = RentObject.new
  end

  def create
    @rent_object = RentObject.new(rent_object_params)

    if @rent_object.save
      redirect_to @rent_object
    else
      render 'new'
    end
  end

  def update
    if @rent_object.update(rent_object_params)
      redirect_to @rent_object
    else
      render 'edit'
    end
  end

  def destroy
    @rent_object.destroy

    redirect_to rent_objects_path
  end

  private

  def set_rent_object
    @rent_object = RentObject.find(params[:id])
  end

  def rent_object_params
    params
      .require(:rent_object)
      .permit(:code,
              :area,
              :function,
              :comment,
              :house_number,
              :settlement_id,
              :street_id)
  end
end
