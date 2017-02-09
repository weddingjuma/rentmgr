FactoryGirl.define do
  factory :rent_object do
    code '3210600000:12:345:6789'
    area 1.3
    function 'Kiosk'
    comment 'Some notes about an object'
    house_number 1
    rented false

    settlement
    street

    transient do
      with_valuation false
    end

    after(:create) do |rent_object, evaluator|
      FactoryGirl.create(:valuation, rent_object: rent_object) if evaluator.with_valuation
    end
  end
end
