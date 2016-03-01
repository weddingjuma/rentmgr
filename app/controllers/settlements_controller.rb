class SettlementsController < ApplicationController
  def index
    @settlements = Settlement.all
  end

  def new
    @settlement = Settlement.new
  end

  def create
    @settlement = Settlement.new(settlement_params)

    @settlement.save
    redirect_to settlements_path
  end

  private

  def settlement_params
    params.require(:settlement).permit(:name, :kind)
  end
end
