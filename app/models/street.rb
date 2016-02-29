class Street < ActiveRecord::Base
  has_many :tenants
  has_many :rent_objects
  enum kind: %w(str blvd)
end
