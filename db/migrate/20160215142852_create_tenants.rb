class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.integer :category
      t.string :name
      t.integer :code, limit: 8
      t.string :house_number
      t.integer :apt_number
      t.text :comment

      t.timestamps null: false
    end
  end
end
