require 'rails_helper'
require_relative '../support/new_rent_object_form'

RSpec.feature 'Create new rent object', type: :feature do
  let(:new_rent_object_form) { NewRentObjectForm.new }
  let(:rent_object_code) { '3210600000:99:999:9999' }

  scenario 'Create new rent object with valid data' do
    new_rent_object_form
      .visit_page
      .fill_in_with(code: rent_object_code)
      .submit

    expect(RentObject.last.code).to eq(rent_object_code)
    expect(current_path).to eq(rent_object_path(RentObject.last))
    expect(page).to have_content(rent_object_code)
  end

  scenario 'Create new rent object with invalid data' do
    new_rent_object_form
      .visit_page
      .submit

    expect(current_path).to eq(rent_objects_path)
    expect(page).to have_content('не може бути пустим')
    expect(RentObject.all).to be_empty
  end
end
