class Extension < ActiveRecord::Base
  default_scope { order(:reg_date, :created_at) }
  belongs_to :agreement
  has_and_belongs_to_many :sessions

  enum category: %w(change addition)

  validates :reg_date,
            :due_date,
            :interest,
            :category,
            :agreement,
            :sessions,
            presence: true
  validates :interest,
            numericality: { only_integer: true, less_than_or_equal_to: 100 }
  validate :older_than_agreement?

  def older_than_agreement?
    if reg_date < agreement.reg_date
      errors.add(:reg_date, "Не може бути підписаним раніше за початковий договір")
    end
  end
end
