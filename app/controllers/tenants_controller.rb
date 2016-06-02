class TenantsController < ApplicationController
  def index
    @tenants = Tenant.all
  end

  def show
    @tenant = Tenant.find(params[:id])
  end

  def edit
    @tenant = Tenant.find(params[:id])
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
    @tenant = Tenant.find(params[:id])

    if @tenant.update(tenant_params)
      redirect_to @tenant
    else
      render 'edit'
    end
  end

  def destroy
    @tenant = Tenant.find(params[:id])
    @tenant.destroy

    redirect_to tenants_path
  end

  private

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
