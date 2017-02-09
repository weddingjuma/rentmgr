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
      message: "Правильний формат: (0000000000:00:000:0000)"
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

  def renew_status
    active_agreement ? update(rented: true) : update(rented: false)
  end

  def active_agreement
    agreements.find_by(archived: false)
  end

  def recent_valuation
    valuations.order(:val_date, :created_at).last if valuations.any?
  end

  def relevant_valuation(to_date)
    if valuations.any?
      valuations
        .where('val_date <= :to_date', { to_date: to_date })
        .order(:val_date, :created_at)
        .last
    end
  end

  def yearly_rent_sum(interest, to_date)
    valuation = relevant_valuation(to_date)
    valuation ? valuation.value * interest / 100 : nil
  end

  def self.available
    where(rented: false)
  end

  def self.rented
    where(rented: true)
  end
end
