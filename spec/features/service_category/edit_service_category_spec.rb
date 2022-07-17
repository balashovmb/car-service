require 'rails_helper'

feature 'Edit service category', '
  To manage workflow user can edit service category
' do
  given!(:service_category) { create(:service_category) }
  scenario 'changes name' do
    visit root_path

    click_on 'Управление категориями и услугами'
    click_on 'Переименовать категорию'

    fill_in 'Название', with: 'Кузовные работы'

    click_on 'Изменить'

    expect(page).to have_content 'Service category was successfully updated'
    expect(page).not_to have_content 'Покраска'
    expect(page).to have_content 'Кузовные работы'
  end
end
