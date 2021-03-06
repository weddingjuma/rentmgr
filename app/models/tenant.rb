class Tenant < ActiveRecord::Base
  enum category: %w(citizen natural_person legal_person)

  belongs_to :settlement
  belongs_to :street
  has_many :agreements, dependent: :destroy
  has_many :rent_objects, through: :agreements

  validates :name, :code, :settlement, :street, presence: true
  validates :code, numericality: { only_integer: true }
  validates :comment, length: {
    maximum: 500,
    too_long: "Максимум 500 символів"
  }
end
