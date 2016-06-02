class Agreement < ActiveRecord::Base
  belongs_to :tenant
  has_and_belongs_to_many :rent_objects
  has_and_belongs_to_many :sessions
  has_many :extensions, dependent: :destroy

  validates :reg_date, :due_date, :interest, :tenant, :sessions, :rent_objects,
            presence: true
  validates :code,
            numericality: { only_integer: true },
            allow_blank: true
  validates :interest,
            numericality: { only_integer: true, less_than_or_equal_to: 100 }
  validates :comment, length: {
    maximum: 500,
    too_long: "Максимум 500 символів"
  }

# Archive before destroying, to renew rent_objects` :rented status
# Touching on destroy callback not working :(
  before_destroy :archive!
  after_save :touch_rent_objects

  def archive!
    update(archived: true)
  end

  def touch_rent_objects
    ro = rent_objects
    ro.each(&:touch)
  end

  def last_reg_date
    recent_extension ? recent_extension.reg_date : reg_date
  end

  # Ensures getting of last extension by date
  def recent_extension
    extensions.order(:reg_date, :created_at).last if extensions.any?
  end

  def relevant_due_date
    if extensions.any?
      recent_extension.due_date
    else
      due_date
    end
  end

  def days_left
    (relevant_due_date - Date.today).to_i
  end

  def relevant_interest
    if extensions.any?
      recent_extension.interest
    else
      interest
    end
  end

  def yearly_rent
    rent_objects.map do |ro|
      if ro.relevant_valuation(last_reg_date)
        ro.relevant_valuation(last_reg_date).value * relevant_interest / 100
      else
        '-'
      end
    end
  end

  def allowed_objects
    return RentObject.all if archived?
    if rent_objects.any?
      ro = RentObject.where(rented: false) + rent_objects
      ro.uniq
    else
      RentObject.where(rented: false)
    end
  end
end
