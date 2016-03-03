class RentObjectsController < ApplicationController
  def index
    @rent_objects = RentObject.all
  end

  def show
    @rent_object = RentObject.find(params[:id])
  end

  def edit
    @rent_object = RentObject.find(params[:id])
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
    @rent_object = RentObject.find(params[:id])

    if @rent_object.update(rent_object_params)
      redirect_to @rent_object
    else
      render 'edit'
    end
  end

  def destroy
    @rent_object = RentObject.find(params[:id])
    @rent_object.destroy

    redirect_to rent_objects_path
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
