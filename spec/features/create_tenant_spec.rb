require 'rails_helper'
require_relative '../support/new_tenant_form'

RSpec.feature 'Create new tenant', type: :feature do
  let(:new_tenant_form) { NewTenantForm.new }
  let(:tenant_name) { 'ACME' }

  scenario 'create new tenant with valid data' do
    new_tenant_form
      .visit_page
      .fill_in_with(name: tenant_name)
      .submit

    expect(Tenant.last.name).to eq(tenant_name)
    expect(current_path).to eq(tenant_path(Tenant.last))
    expect(page).to have_content(tenant_name)
  end

  scenario 'create new tenant with invalid data' do
    new_tenant_form
      .visit_page
      .submit

    expect(current_path).to eq(tenants_path)
    expect(page).to have_content('Введіть назву орендаря')
    expect(Tenant.all).to be_empty
  end
end
