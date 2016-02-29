class AddSettlementRefToRentObjects < ActiveRecord::Migration
  def change
    add_reference :rent_objects, :settlement, index: true, foreign_key: true
  end
end
