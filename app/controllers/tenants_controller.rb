class TenantsController < ApplicationController
  before_action :set_tenant, only: [:show, :edit, :update, :destroy]

  def index
    @tenants = Tenant.includes(:settlement, :street)
  end

  def show
  end

  def edit
  end

  def new
    @tenant = Tenant.new
  end

  def create
    @tenant = Tenant.new(tenant_params)

    if @tenant.save
      redirect_to @tenant
    else
      render 'new'
    end
  end

  def update
    if @tenant.update(tenant_params)
      redirect_to @tenant
    else
      render 'edit'
    end
  end

  def destroy
    @tenant.destroy

    redirect_to tenants_path
  end

  private

  def set_tenant
    @tenant = Tenant.find(params[:id])
  end

  def tenant_params
    params
      .require(:tenant)
      .permit(:category,
              :name,
              :code,
              :house_number,
              :apt_number,
              :comment,
              :settlement_id,
              :street_id)
  end
end
