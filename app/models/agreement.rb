class Agreement < ActiveRecord::Base
  belongs_to :tenant
  has_and_belongs_to_many :rent_objects,
    after_remove: Proc.new { |a, ro| ro.renew_status },
    after_add: Proc.new { |a, ro| ro.renew_status }
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
  validate :no_object_status_conflict

# Archive before destroying (trigger after_save), to renew rent_objects` :rented status
  before_destroy :archive!
  after_save :renew_ro_status

  def archive!
    update(archived: true)
  end

  def renew_ro_status
    rent_objects.each(&:renew_status)
  end

  def last_reg_date
    extensions.any? ? recent_extension.reg_date : reg_date
  end

  def recent_extension
    extensions.last if extensions.any?
  end

  def relevant_due_date
    extensions.any? ? recent_extension.due_date : due_date
  end

  def days_left
    (relevant_due_date - Date.today).to_i
  end

  def relevant_interest
    extensions.any? ? recent_extension.interest : interest
  end

  def yearly_rent_sums
    rent_objects.map { |ro| ro.yearly_rent_sum(relevant_interest, last_reg_date) }
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

  private

  def has_objects_rented_by_other_active_agreements
    other_agreement_ids = rent_objects.map(&:agreement_ids).flatten.uniq - [self.id]
    other_agreements = Agreement.find(other_agreement_ids)
    other_agreements.map(&:archived?).include?(false)
  end

  def no_object_status_conflict
    if !archived? && has_objects_rented_by_other_active_agreements
      errors.add(:rent_objects, 'have other unarchived agreements')
    end
  end
end
