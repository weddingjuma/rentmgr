class Extension < ActiveRecord::Base
  belongs_to :agreement
  has_and_belongs_to_many :sessions

  enum category: %w(change addition)

  validates :code,
            :sign_date,
            :due_date,
            :interest,
            :category,
            :agreement,
            :sessions,
            presence: true
  validate :older_than_agreement?

  def older_than_agreement?
    if sign_date < agreement.sign_date
      errors.add(:sign_date, "Не може бути підписаним раніше за початковий договір")
    end
  end
end
