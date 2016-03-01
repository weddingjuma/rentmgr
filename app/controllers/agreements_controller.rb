class AgreementsController < ApplicationController
  def index
    @agreements = Agreement.all
  end

  def show
    @agreement = Agreement.find(params[:id])
  end

  def new
    @agreement = Agreement.new
  end

  def create
    @agreement = Agreement.new(agreement_params)

    @agreement.save
    redirect_to @agreement
  end

  private

  def agreement_params
    params.require(:agreement)
      .permit(:code, :sign_date, :due_date, :archived, :interest, :comment)
  end
end
