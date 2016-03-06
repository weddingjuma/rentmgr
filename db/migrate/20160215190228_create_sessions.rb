class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.date :s_date
      t.string :code

      t.timestamps null: false
    end
  end
end
