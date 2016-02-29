class AddTenantRefToAgreements < ActiveRecord::Migration
  def change
    add_reference :agreements, :tenant, index: true, foreign_key: true
  end
end
