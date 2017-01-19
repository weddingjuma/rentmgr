require 'rails_helper'

RSpec.feature 'Render main pages', type: :feature do
  scenario 'display agreements home page' do
    visit '/'
    expect(current_path).to eq(agreements_path)
    expect(page).to have_content('Новий договір')
  end

  scenario 'display tenants page' do
    visit '/tenants'
    expect(page).to have_content('Новий орендар')
  end

  scenario 'display rent_objects page' do
    visit '/rent_objects'
    expect(page).to have_content('Новий об’єкт оренди')
  end

  scenario 'display sessions page' do
    visit '/sessions'
    expect(page).to have_content('Нова сесія')
  end

  scenario 'display streets page' do
    FactoryGirl.create(:street, name: 'Street Name')
    visit '/streets'
    expect(page).to have_content('Додати вулицю')
    expect(page).to have_content('Street Name')
  end

  scenario 'display settlements page' do
    visit '/settlements'
    expect(page).to have_content('Додати населений пункт')
  end
end
