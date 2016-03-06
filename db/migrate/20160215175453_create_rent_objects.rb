class CreateRentObjects < ActiveRecord::Migration
  def change
    create_table :rent_objects do |t|
      t.string :code
      t.decimal :area
      t.text :function
      t.text :comment
      t.string :house_number
      t.boolean :rented, default: false

      t.timestamps null: false
    end
  end
end
