class CreateValuations < ActiveRecord::Migration
  def change
    create_table :valuations do |t|
      t.string :code
      t.date :val_date
      t.decimal :value

      t.timestamps null: false
    end
  end
end
