class NewRentObjectForm
  include Capybara::DSL

  def initialize
    @code = '3210600000:99:999:9999'
    @area = 0.12
    @function = 'Object Function'
    @comment = 'Default Comment'
    @house_number = '14-a'

    @settlement = FactoryGirl.create(:settlement)
    @street = FactoryGirl.create(:street)
  end

  def visit_page
    visit('/rent_objects')
    click_on('Новий об’єкт оренди')
    self
  end

  def fill_in_with(params = {})
    fill_in('Кадастровий номер', with: params.fetch(:code, @code))
    fill_in('Площа', with: params.fetch(:area, @area))
    fill_in('Призначення', with: params.fetch(:function, @function))
    select(params.fetch(:settlement, @settlement.name), from: 'Населений пункт')
    select(params.fetch(:street, @street.name), from: 'Вулиця')
    fill_in('Номер будинку', with: params.fetch(:house_number, @house_number))
    fill_in('Коментар', with: params.fetch(:comment, @comment))
    self
  end

  def submit
    click_on('Зберегти')
  end
end
