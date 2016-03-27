class CreateJoinTableAgreementRentObject < ActiveRecord::Migration
  def change
    create_join_table :agreements, :rent_objects do |t|
      # t.index [:agreement_id, :rent_object_id]
      # t.index [:rent_object_id, :agreement_id]
    end
  end
end
