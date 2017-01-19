require 'faker'

10.times { Street.create(kind: Street.kinds.to_a.sample[1], name: Faker::Address.street_title) }
10.times { Settlement.create(kind: Settlement.kinds['city'], name: Faker::Address.city) }

streets = Street.pluck(:id)
settlements = Settlement.pluck(:id)

50.times do
  tenant = Tenant.new(
    category: Tenant.categories.to_a.sample[1],
    name: Faker::Company.name,
    code: Faker::Number.number(9),
    house_number: Faker::Address.building_number,
    apt_number: Faker::Number.number(2),
    comment: Faker::Lorem.paragraph,
    street_id: streets.sample,
    settlement_id: settlements.sample
  )
  if tenant.citizen? || tenant.natural_person?
    tenant.name = Faker::Name.name_with_middle
  end
  tenant.save
end

20.times do
  RentObject.create(
    code: Faker::Base.numerify("3210600000:##:###:####"),
    area: Faker::Number.decimal(1, 2),
    function: Faker::Commerce.department,
    comment: Faker::Lorem.paragraph,
    house_number: Faker::Number.number(2),
    street_id: streets.sample,
    settlement_id: settlements.sample
  )
end

RentObject.all.each do |ro|
  (rand(5) + 1).times do
    ro.valuations.create(
      code: Faker::Base.numerify('###-##-#/#'),
      val_date: Faker::Date.between(10.days.ago, Date.today + rand(10).days),
      value: Faker::Number.decimal(4, 2)
    )
  end
end

10.times do
  Session.create(
    s_date: Faker::Date.between(10.days.ago, Date.today),
    code: Faker::Number.numerify('###-##-##')
  )
end

10.times do
  break if RentObject.available.empty?

  agreement = Agreement.new(
    code: Faker::Number.number(10),
    reg_date: Faker::Date.between(Date.today + 1.day, Date.today + 1.week),
    due_date: Faker::Date.between(Date.today + 2.month, Date.today + 1.year),
    interest: Faker::Number.between(3, 16),
    comment: Faker::Lorem.paragraph,
    tenant: Tenant.all.sample
  )
  agreement.sessions = Session.where("s_date < ?", agreement.reg_date).sample(rand(1) + 1)
  agreement.rent_objects = RentObject.available.sample(rand(1) + 2)
  agreement.save
end

10.times do
  Session.create(
    s_date: Faker::Date.between(Date.today + 2.days, Date.today + 1.week),
    code: Faker::Number.numerify('###-##-##')
  )
end

Agreement.all.each do |a|
  extension = a.extensions.new(
    code: Faker::Number.number(10),
    reg_date: Faker::Date.between(a.reg_date + 1.week, a.due_date - 1.week),
    interest: Faker::Number.between(4, 17),
    comment: Faker::Lorem.paragraph,
    category: Extension.categories.to_a.sample[1]
  )
  extension.due_date = Faker::Date.between(extension.reg_date, extension.reg_date + 1.year)
  extension.sessions = Session.where("s_date > ?", a.reg_date).sample(rand(1) + 1)
  extension.save
end
