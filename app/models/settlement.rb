class Settlement < ActiveRecord::Base
  has_many :tenants
  has_many :rent_objects
  enum kind: %w(city willage)
end
