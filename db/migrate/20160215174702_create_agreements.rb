class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.string :code
      t.date :reg_date
      t.date :due_date
      t.boolean :easement, default: false
      t.boolean :archived, default: false
      t.integer :interest
      t.text :comment

      t.timestamps null: false
    end
  end
end
