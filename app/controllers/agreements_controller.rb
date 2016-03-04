class AgreementsController < ApplicationController
  def index
    @agreements = Agreement.all
  end

  def show
    @agreement = Agreement.find(params[:id])
  end

  def edit
    @agreement = Agreement.find(params[:id])
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
    @agreement = Agreement.find(params[:id])

    if @agreement.update(agreement_params)
      redirect_to @agreement
    else
      render 'edit'
    end
  end

  def destroy
    @agreement = Agreement.find(params[:id])
    @agreement.destroy

    redirect_to agreements_path
  end

  private

  def agreement_params
    params.require(:agreement)
      .permit(:code,
              :sign_date,
              :due_date,
              :archived,
              :easement,
              :interest,
              :comment,
              :tenant_id,
              :rent_object_id,
              session_ids: [])
  end
end
