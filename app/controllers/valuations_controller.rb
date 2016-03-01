class ValuationsController < ApplicationController
  def index
    @valuations = Valuation.all
  end

  def show
    @rent_object = RentObject.find(params[:rent_object_id])
    @valuation = Valuation.find(params[:id])
  end

  def new
    @rent_object = RentObject.find(params[:rent_object_id])
    @valuation = Valuation.new
  end

  def create
    @rent_object = RentObject.find(params[:rent_object_id])
    @valuation = Valuation.new(valuation_params)
    @valuation.rent_object = @rent_object

    @valuation.save
    redirect_to [@rent_object, @valuation]
  end

  private

  def valuation_params
    params.require(:valuation).permit(:code, :val_date, :value, :rent_object_id)
  end
end
