class AddStreetRefToTenant < ActiveRecord::Migration
  def change
    add_reference :tenants, :street, index: true, foreign_key: true
  end
end
