class RemoveRentObjectRefFromAgreements < ActiveRecord::Migration
  def change
    remove_reference :agreements, :rent_object, index: true, foreign_key: true
  end
end
