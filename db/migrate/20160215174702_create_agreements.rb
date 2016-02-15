class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.integer :code
      t.date :sign_date
      t.date :due_date
      t.boolean :archived
      t.integer :interest
      t.text :comment

      t.timestamps null: false
    end
  end
end
