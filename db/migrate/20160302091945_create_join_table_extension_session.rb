class CreateJoinTableExtensionSession < ActiveRecord::Migration
  def change
    create_join_table :extensions, :sessions do |t|
      # t.index [:extension_id, :session_id]
      # t.index [:session_id, :extension_id]
    end
  end
end
