class ExtensionsController < ApplicationController
  def show
    @extension = Extension.find(params[:id])
    @agreement = @extension.agreement
  end

  def edit
    @extension = Extension.find(params[:id])
    @agreement = @extension.agreement
  end

  def new
    @agreement = Agreement.find(params[:agreement_id])
    @extension = Extension.new
    @extension.due_date = @agreement.relevant_due_date
  end

  def create
    @agreement = Agreement.find(params[:agreement_id])
    @extension = Extension.new(extension_params)
    @extension.agreement = @agreement

    if @extension.save
      redirect_to @extension.agreement
    else
      render 'new'
    end
  end

  def update
    @extension = Extension.find(params[:id])

    if @extension.update(extension_params)
      redirect_to agreement_path(@extension.agreement)
    else
      render 'edit'
    end
  end

  def destroy
    @extension = Extension.find(params[:id])
    agreement = @extension.agreement

    @extension.destroy

    redirect_to agreement_path(agreement)
  end

  private

  def extension_params
    params.require(:extension)
      .permit(:code,
              :sign_date,
              :due_date,
              :interest,
              :comment,
              :category,
              :agreement,
              session_ids: [])
  end
end
