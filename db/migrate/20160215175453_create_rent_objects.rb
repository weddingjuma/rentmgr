class CreateRentObjects < ActiveRecord::Migration
  def change
    create_table :rent_objects do |t|
      t.integer :code
      t.decimal :area
      t.text :function
      t.text :comment
      t.string :house_number

      t.timestamps null: false
    end
  end
end
