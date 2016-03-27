class Valuation < ActiveRecord::Base
  belongs_to :rent_object

  validates :val_date, :value, :rent_object, presence: true
  validates :code,
    format: {
      with: %r{
        \A(
        (\d{2}-\d\/\d{2}-\d\/\d{1,4})|
        (\d{3}-\d{2}-\d\/\d)|
        (\d{2}-\d{4}-\d\.\d-\d{1,4}\/\d-\d{2})
        )\Z
      }x,
      message: "Невірний формат."
    },
    presence: true
  validates :value, numericality: true
end
