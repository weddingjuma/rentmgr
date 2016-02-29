class RentObject < ActiveRecord::Base
  belongs_to :settlement
  belongs_to :street
  has_many :agreements
  has_many :valuations
  has_many :tenants, through: :agreements
end
