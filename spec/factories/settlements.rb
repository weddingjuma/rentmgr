FactoryGirl.define do
  factory :settlement, aliases: [:city] do
    kind Settlement.kinds[:city]
    sequence(:name) { |n| "Settlement #{n}" }

    factory :willage do
      kind Settlement.kinds[:willage]
    end
  end
end
