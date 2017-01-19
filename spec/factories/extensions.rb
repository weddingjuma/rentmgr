FactoryGirl.define do
  factory :extension do
    code '1234567890'
    reg_date Time.current
    due_date Time.current + 1.month
    interest 10
    comment 'Comments'
    category Extension.categories.to_a.sample[1]

    agreement

    before(:create) do |extension|
      extension.sessions = [FactoryGirl.create(:session)]
    end
  end
end
