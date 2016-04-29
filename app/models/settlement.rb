class Settlement < ActiveRecord::Base
  has_many :tenants, dependent: :restrict_with_error
  has_many :rent_objects, dependent: :restrict_with_error
  enum kind: %w(city willage)

  validates :name, :kind, presence: true
end
