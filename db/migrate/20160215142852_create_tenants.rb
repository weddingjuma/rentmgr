class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :kind
      t.string :name
      t.integer :code
      t.string :house_number
      t.integer :apt_number
      t.text :comment

      t.timestamps null: false
    end
  end
end
