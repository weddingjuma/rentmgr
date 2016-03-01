class Settlement < ActiveRecord::Base
  has_many :tenants
  has_many :rent_objects
  enum kind: %w(city willage)

  validates :name, :kind, presence: true
end
