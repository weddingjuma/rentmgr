class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.date :s_date
      t.integer :code

      t.timestamps null: false
    end
  end
end
