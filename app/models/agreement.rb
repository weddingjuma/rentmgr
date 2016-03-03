class Agreement < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :rent_object
  has_and_belongs_to_many :sessions
  has_many :extensions, dependent: :destroy

  validates :code, :sign_date, :due_date, :interest, :tenant, :rent_object,
    presence: true
  validates :code, numericality: { only_integer: true }
  validates :interest,
    numericality: { only_integer: true, less_than_or_equal_to: 100 }
  validates :comment, length: {
    maximum: 500,
    too_long: "Максимум 500 символів"
  }

  after_destroy :touch_rent_object
  after_create :touch_rent_object
  after_save :touch_rent_object
  after_update :touch_rent_object

  def touch_rent_object
    self.rent_object.touch
  end

  def relevant_valuation
    last_sign_date = self.sign_date

    last_sign_date = self.recent_extension.sign_date if self.extensions.any?

    self.rent_object.recent_valuation_up_to last_sign_date
  end

  # Ensures getting of last extension by date
  def recent_extension
    if self.extensions.any?
      self.extensions.where(archived: false).order(:sign_date, :created_at).last
    else
      nil
    end
  end
end
