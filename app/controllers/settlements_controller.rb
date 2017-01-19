class SettlementsController < ApplicationController
  before_action :set_settlement, only: [:edit, :update, :destroy]

  def index
    @settlements = Settlement.all
  end

  def edit
  end

  def new
    @settlement = Settlement.new
  end

  def create
    @settlement = Settlement.new(settlement_params)

    if @settlement.save
      redirect_to settlements_path
    else
      render 'new'
    end
  end

  def update
    if @settlement.update(settlement_params)
      redirect_to settlements_path
    else
      render 'edit'
    end
  end

  def destroy
    @settlement.destroy

    redirect_to settlements_path
  end

  private

  def set_settlement
    @settlement = Settlement.find(params[:id])
  end

  def settlement_params
    params.require(:settlement).permit(:name, :kind)
  end
end
