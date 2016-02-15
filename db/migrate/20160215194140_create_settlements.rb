class CreateSettlements < ActiveRecord::Migration
  def change
    create_table :settlements do |t|
      t.string :name
      t.integer :kind

      t.timestamps null: false
    end
  end
end
