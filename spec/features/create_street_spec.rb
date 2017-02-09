require 'rails_helper'
require_relative '../support/new_street_form'

RSpec.feature 'Create street', type: :feature do
  let(:new_street_form) { NewStreetForm.new }
  let(:street_name) { 'Нова вулиця' }

  scenario 'create new street with valid data' do
    new_street_form
      .visit_page
      .fill_in_with(name: street_name)
      .submit

    expect(current_path).to eq(streets_path)
    expect(page).to have_content(street_name)
    expect(Street.last.name).to eq(street_name)
  end

  scenario 'create new street with invalid data' do
    new_street_form
      .visit_page
      .submit

    expect(current_path).to eq(streets_path)
    expect(page).to have_content('Оберіть тип вулиці')
    expect(page).to have_content('Введіть назву вулиці')
    expect(Street.all).to be_empty
  end
end
