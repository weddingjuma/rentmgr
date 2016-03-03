class RentObject < ActiveRecord::Base
  belongs_to :settlement
  belongs_to :street
  has_many :agreements
  has_many :valuations, dependent: :destroy
  has_many :tenants, through: :agreements

  validates :code, :area, :function, :settlement, :street, presence: true
  validates :code, numericality: { only_integer: true }
  validates :area, numericality: true
  validates :comment, :function, :length => {
    :maximum => 500,
    :too_long => "Максимум 500 символів"
  }

  after_touch :renew_status

  def renew_status
    if self.active_agreement
      self.rented = true
      self.save
    else
      self.rented = false
      self.save
    end
  end

  # Allow single current agreement or zero unarchived agreements.
  def has_conflicting_agreements?
    if self.agreements.where(archived: false).count > 1
      true
    else
      false
    end
  end

  def active_agreement
    if !self.has_conflicting_agreements?
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

  def recent_valuation_up_to(to_date)
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
