FactoryGirl.define do
  factory :agreement do
    code '1234567890'
    reg_date Time.current
    due_date Time.current + 1.month
    easement false
    archived false
    interest 10
    comment 'Comments'

    tenant

    before(:create) do |agreement|
      agreement.rent_objects = [FactoryGirl.create(:rent_object, with_valuation: true)]
      agreement.sessions = [FactoryGirl.create(:session)]
    end
  end
end
