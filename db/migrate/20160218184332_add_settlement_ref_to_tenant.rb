class AddSettlementRefToTenant < ActiveRecord::Migration
  def change
    add_reference :tenants, :settlement, index: true, foreign_key: true
  end
end
