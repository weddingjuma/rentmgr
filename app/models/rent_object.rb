class RentObject < ActiveRecord::Base
  belongs_to :settlement
  belongs_to :street
  has_and_belongs_to_many :agreements
  has_many :valuations, dependent: :destroy
  has_many :tenants, through: :agreements, dependent: :restrict_with_error

  validates :function, :settlement, :street, presence: true
  validates :code,
    format: {
      with: /\A\d{10}:\d{2}:\d{3}:\d{4}\Z/,
      message: "Правильний формат: (000000000:00:000:0000)"
    },
    presence: true
  validates :area,
    numericality: { greater_than: 0, message: "Значення має бути більшим нуля" },
    presence: true
  validates :comment, :function,
    length: {
      maximum: 500,
      too_long: "Максимальна кількість символів: 500"
    }

  after_touch :renew_status

  def renew_status
    if self.active_agreement
      self.rented = true
    else
      self.rented = false
    end
    self.save
  end

  def active_agreement
    # Allow single active agreement or zero unarchived agreements.
    if !(self.agreements.where(archived: false).count > 1)
      self.agreements.where(archived: false).first
    else
      raise "Error. Multiple active agreements detected."
    end
  end

  # Ensures getting of last valuation by date. No need to validate for
  # insertion`s chronological order.
  #
  # If rent_object valuated (impossible?) on the same day twice or more,
  # last valuation will be used
  def recent_valuation
    if self.valuations.any?
      self.valuations.order(:val_date, :created_at).last
    else
      nil
    end
  end

  def relevant_valuation(to_date)
    if self.valuations.any?
      valuation = self.valuations
        .where("val_date <= :to_date", {to_date: to_date})
        .order(:val_date, :created_at)
        .last
    else
      nil
    end
  end
end
