class CreateJoinTableAgreementSession < ActiveRecord::Migration
  def change
    create_join_table :agreements, :sessions do |t|
      # t.index [:agreement_id, :session_id]
      # t.index [:session_id, :agreement_id]
    end
  end
end
