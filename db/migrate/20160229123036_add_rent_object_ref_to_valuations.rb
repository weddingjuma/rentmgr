class AddRentObjectRefToValuations < ActiveRecord::Migration
  def change
    add_reference :valuations, :rent_object, index: true, foreign_key: true
  end
end
