class AddStreetRefToRentObjects < ActiveRecord::Migration
  def change
    add_reference :rent_objects, :street, index: true, foreign_key: true
  end
end
