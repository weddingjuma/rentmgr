require 'rails_helper'
require_relative '../support/new_settlement_form'

RSpec.feature 'Create new settlement', type: :feature do
  let(:new_settlement_form) { NewSettlementForm.new }
  let(:settlement_name) { 'Назва' }

  scenario 'create new settlement with valid data' do
    new_settlement_form
      .visit_page
      .fill_in_with(name: settlement_name)
      .submit

    expect(current_path).to eq(settlements_path)
    expect(page).to have_content(settlement_name)
    expect(Settlement.last.name).to eq(settlement_name)
  end

  scenario 'create new settlement with invalid data' do
    new_settlement_form
      .visit_page
      .submit

    expect(current_path).to eq(settlements_path)
    expect(page).to have_content('не може бути пустим')
    expect(Settlement.all).to be_empty
  end
end
