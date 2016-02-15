class CreateStreets < ActiveRecord::Migration
  def change
    create_table :streets do |t|
      t.string :name
      t.integer :kind

      t.timestamps null: false
    end
  end
end
