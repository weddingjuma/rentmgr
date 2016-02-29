class AddRentObjectRefToAgreements < ActiveRecord::Migration
  def change
    add_reference :agreements, :rent_object, index: true, foreign_key: true
  end
end
