class Session < ActiveRecord::Base
  has_and_belongs_to_many :agreements
  has_and_belongs_to_many :extensions

  validates :s_date, presence: true
  validates :code,
    format: {
      with: /\A\d{3,4}-\d{2}-\d{2}\Z/,
      message: "Правильний формат: (0000-00-00) або (000-00-00)"
    },
    presence: true
end
