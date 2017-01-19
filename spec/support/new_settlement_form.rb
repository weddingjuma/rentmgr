class NewSettlementForm
  include Capybara::DSL

  def initialize
    @kind = 'місто'
    @name = 'назва населеного пункту'
  end

  def visit_page
    visit('/settlements')
    click_on('Додати населений пункт')
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
