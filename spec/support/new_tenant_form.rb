class NewTenantForm
  include Capybara::DSL

  def initialize
    @category = 'громадянин'
    @name = 'Назва Орендаря'
    @code = '123'
    @house_number = '1'
    @apt_number = 1
    @comment = 'Коментар'

    @settlement = FactoryGirl.create(:settlement)
    @street = FactoryGirl.create(:street)
  end

  def visit_page
    visit('/tenants')
    click_on('Новий орендар')
    self
  end

  def fill_in_with(params = {})
    select(params.fetch(:category, @category), from: 'Форма')
    fill_in('Назва', with: params.fetch(:name, @name))
    fill_in('Код', with: params.fetch(:code, @code))
    select(params.fetch(:settlement, @settlement.name), from: 'Населений пункт')
    select(params.fetch(:street, @street.name), from: 'Вулиця')
    fill_in('Номер будинку', with: params.fetch(:house_number, @house_number))
    fill_in('Номер квартири', with: params.fetch(:apt_number, @apt_number))
    fill_in('Коментар', with: params.fetch(:comment, @comment))
    self
  end

  def submit
    click_on('Зберегти')
  end
end
