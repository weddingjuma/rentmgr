class Tenant < ActiveRecord::Base
  belongs_to :settlement
  belongs_to :street
  has_many :agreements
  has_many :rent_objects, through: :agreements
end
