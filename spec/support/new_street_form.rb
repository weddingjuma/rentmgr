class NewStreetForm
  include Capybara::DSL

  def initialize
    @kind = 'вулиця'
    @name = 'назва вулиці'
  end

  def visit_page
    visit('/streets')
    click_on('Додати вулицю')
    self
  end

  def fill_in_with(params = {})
    select(params.fetch(:kind, @kind), from: 'Тип')
    fill_in('Назва', with: params.fetch(:name, @name))
    self
  end

  def submit
    click_on('Зберегти')
  end
end
