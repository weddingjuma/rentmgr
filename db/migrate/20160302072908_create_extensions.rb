class CreateExtensions < ActiveRecord::Migration
  def change
    create_table :extensions do |t|
      t.string :code
      t.date :sign_date
      t.date :due_date
      t.integer :interest
      t.text :comment
      t.integer :category
      t.references :agreement, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
