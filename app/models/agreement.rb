class Agreement < ActiveRecord::Base
  belongs_to :tenant
  has_and_belongs_to_many :rent_objects
  has_and_belongs_to_many :sessions
  has_many :extensions, dependent: :destroy

  validates :code, :sign_date, :due_date, :interest, :tenant, :rent_objects,
    presence: true
  validates :code, numericality: { only_integer: true }
  validates :interest,
    numericality: { only_integer: true, less_than_or_equal_to: 100 }
  validates :comment, length: {
    maximum: 500,
    too_long: "Максимум 500 символів"
  }

  after_destroy :touch_rent_objects
  after_save :touch_rent_objects

  def touch_rent_objects
    self.rent_objects.each(&:touch)
  end

  def last_sign_date
    recent_extension ? recent_extension.sign_date : sign_date
  end

  # Ensures getting of last extension by date
  def recent_extension
    if self.extensions.any?
      self.extensions.order(:sign_date).last
    else
      nil
    end
  end

  def relevant_due_date
    if self.extensions.any?
      self.recent_extension.due_date
    else
      self.due_date
    end
  end

  def days_left
    (self.relevant_due_date - Date.today).to_i
  end

  def relevant_interest
    if self.extensions.any?
      self.recent_extension.interest
    else
      self.interest
    end
  end

  def yearly_rent
    rent_objects.map do |ro|
      if ro.valuations.any?
        ro.relevant_valuation(last_sign_date).value * relevant_interest / 100
      else
        '-'
      end
    end
  end
end
