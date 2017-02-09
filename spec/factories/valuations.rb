FactoryGirl.define do
  factory :valuation do
    code '123-45-6/7'
    val_date Time.current
    value 12345

    rent_object
  end
end
