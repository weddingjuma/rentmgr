class RentObject < ActiveRecord::Base
  belongs_to :settlement
  belongs_to :street
  has_many :agreements
  has_many :valuations
  has_many :tenants, through: :agreements

  validates :code, :area, :function, :settlement, :street, presence: true
  validates :code, numericality: { only_integer: true }
  validates :area, numericality: true
  validates :comment, :function, :length => {
    :maximum => 500,
    :too_long => "Максимум 500 символів"
  }
end
