class Session < ActiveRecord::Base
  has_and_belongs_to_many :agreements

  validates :s_date, :code, presence: true
  validates :code, numericality: { only_integer: true }
end
