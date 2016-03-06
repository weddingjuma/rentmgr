class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.date :s_date
      t.integer :code, limit: 8

      t.timestamps null: false
    end
  end
end
