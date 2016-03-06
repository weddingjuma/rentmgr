class CreateValuations < ActiveRecord::Migration
  def change
    create_table :valuations do |t|
      t.integer :code, limit: 8
      t.date :val_date
      t.decimal :value

      t.timestamps null: false
    end
  end
end
