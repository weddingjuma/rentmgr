FactoryGirl.define do
  factory :tenant, aliases: [:citizen] do
    category Tenant.categories[:citizen]
    name 'Tenant Name'
    code '123456123'
    house_number 1
    apt_number 1
    comment 'Some notes about a tenant'

    association :settlement, factory: :settlement
    street

    factory :natural_person do
      category Tenant.categories[:natural_person]
    end

    factory :legal_person do
      category Tenant.categories[:legal_person]
    end
  end
end
