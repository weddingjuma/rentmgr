class AgreementsController < ApplicationController
  before_action :set_agreement, only: [:show, :edit, :update, :destroy]

  def index
    @search = Agreement.search(params[:q])
    @agreements = @search.result.includes(:rent_objects, :tenant, :extensions)
  end

  def show
  end

  def edit
  end

  def new
    @agreement = Agreement.new
  end

  def create
    @agreement = Agreement.new(agreement_params)

    if @agreement.save
      redirect_to @agreement
    else
      render 'new'
    end
  end

  def update
    if @agreement.update(agreement_params)
      redirect_to @agreement
    else
      render 'edit'
    end
  end

  def destroy
    @agreement.destroy

    redirect_to agreements_path
  end

  private

  def set_agreement
    @agreement = Agreement.find(params[:id])
  end

  def agreement_params
    params
      .require(:agreement)
      .permit(:code,
              :reg_date,
              :due_date,
              :archived,
              :easement,
              :interest,
              :comment,
              :tenant_id,
              rent_object_ids: [],
              session_ids: [])
  end
end
