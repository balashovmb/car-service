require 'rails_helper'

feature 'Create executor', '
  To manage workflow user can create service executor
' do
  context 'valid params' do
    scenario 'creates' do
      visit root_path

      click_on 'Управление исполнителями'
      click_on 'Создать исполнителя'
      fill_in 'Имя', with: 'Иван Иванов'
      click_on 'Создать'

      expect(page).to have_content "Executor was successfully created"
    end
  end
end
