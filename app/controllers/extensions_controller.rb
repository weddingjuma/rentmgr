class ExtensionsController < ApplicationController
  before_action :set_extension, only: [:show, :edit, :update, :destroy]

  def show
    @agreement = @extension.agreement
  end

  def edit
    @agreement = @extension.agreement
  end

  def new
    @agreement = Agreement.find(params[:agreement_id])
    @extension = Extension.new
    @extension.due_date = @agreement.relevant_due_date
  end

  def create
    @agreement = Agreement.find(params[:agreement_id])
    @extension = @agreement.extensions.build(extension_params)

    if @extension.save
      redirect_to @extension.agreement
    else
      render 'new'
    end
  end

  def update
    @agreement = @extension.agreement

    if @extension.update(extension_params)
      redirect_to agreement_path(@extension.agreement)
    else
      render 'edit'
    end
  end

  def destroy
    @extension.destroy

    redirect_to agreement_path(@extension.agreement)
  end

  private

  def set_extension
    @extension = Extension.find(params[:id])
  end

  def extension_params
    params
      .require(:extension)
      .permit(:code,
              :reg_date,
              :due_date,
              :interest,
              :comment,
              :category,
              :agreement,
              session_ids: [])
  end
end
