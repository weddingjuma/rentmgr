class Agreement < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :rent_object
  has_and_belongs_to_many :sessions

  has_many :updates, :class_name => "Agreement", :foreign_key => "original_id"
  belongs_to :original, :class_name => "Agreement"
end
