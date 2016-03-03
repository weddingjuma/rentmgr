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
end
