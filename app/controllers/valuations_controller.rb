class ValuationsController < ApplicationController
  def index
    @valuations = Valuation.all
  end

  def show
    @valuation = Valuation.find(params[:id])
    @rent_object = @valuation.rent_object
  end

  def edit
    @valuation = Valuation.find(params[:id])
    @rent_object = @valuation.rent_object
  end

  def new
    @rent_object = RentObject.find(params[:rent_object_id])
    @valuation = Valuation.new
  end

  def create
    @rent_object = RentObject.find(params[:rent_object_id])
    @valuation = @rent_object.valuations.build(valuation_params)

    if @valuation.save
      redirect_to @rent_object
    else
      render 'new'
    end
  end

  def update
    @valuation = Valuation.find(params[:id])

    if @valuation.update(valuation_params)
      redirect_to rent_object_path(@valuation.rent_object)
    else
      render 'edit'
    end
  end

  def destroy
    @valuation = Valuation.find(params[:id])
    rent_object = @valuation.rent_object

    @valuation.destroy

    redirect_to :back
  end

  private

  def valuation_params
    params.require(:valuation).permit(:code, :val_date, :value, :rent_object_id)
  end
end
