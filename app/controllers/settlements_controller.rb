class SettlementsController < ApplicationController
  def index
    @settlements = Settlement.all
  end

  def edit
    @settlement = Settlement.find(params[:id])
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
    @settlement = Settlement.find(params[:id])

    if @settlement.update(settlement_params)
      redirect_to settlements_path
    else
      render 'edit'
    end
  end

  def destroy
    @settlement = Settlement.find(params[:id])
    @settlement.destroy

    redirect_to settlements_path
  end

  private

  def settlement_params
    params.require(:settlement).permit(:name, :kind)
  end
end
