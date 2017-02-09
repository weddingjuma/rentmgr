FactoryGirl.define do
  factory :street do
    kind Street.kinds[:str]
    sequence(:name) { |n| "Street #{n}" }

    factory :boulevard do
      kind Street.kinds[:blvd]
    end

    factory :lane do
      kind Street.kinds[:lane]
    end
  end
end
