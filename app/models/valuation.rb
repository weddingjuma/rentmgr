class Valuation < ActiveRecord::Base
  belongs_to :rent_object

  validates :code, :val_date, :value, :rent_object, presence: true
  validates :code, numericality: { only_integer: true }
  validates :value, numericality: true
end
