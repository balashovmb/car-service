require 'rails_helper'

feature 'Create service category', '
  To manage workflow user can create service category
' do
  context 'valid params' do
    scenario 'creates' do
      visit root_path

      click_on 'Управление категориями и услугами'
      click_on 'Создать категорию'
      fill_in 'Название', with: 'Покраска'
      click_on 'Создать'

      expect(page).to have_content 'Service category was successfully created'
    end
  end
end
