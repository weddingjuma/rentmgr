class ValuationsController < ApplicationController
  before_action :set_valuation, only: [:show, :edit, :update, :destroy]
  before_action :set_rent_object, only: [:new, :create]

  def index
    @valuations = Valuation.all
  end

  def show
    @rent_object = @valuation.rent_object
  end

  def edit
    @rent_object = @valuation.rent_object
  end

  def new
    @valuation = Valuation.new
  end

  def create
    @valuation = @rent_object.valuations.build(valuation_params)

    if @valuation.save
      redirect_to @rent_object
    else
      render 'new'
    end
  end

  def update
    @rent_object = @valuation.rent_object

    if @valuation.update(valuation_params)
      redirect_to rent_object_path(@valuation.rent_object)
    else
      render 'edit'
    end
  end

  def destroy
    @valuation.destroy

    redirect_to :back
  end

  private

  def set_valuation
    @valuation = Valuation.find(params[:id])
  end

  def set_rent_object
    @rent_object = RentObject.find(params[:rent_object_id])
  end

  def valuation_params
    params.require(:valuation).permit(:code, :val_date, :value, :rent_object_id)
  end
end
