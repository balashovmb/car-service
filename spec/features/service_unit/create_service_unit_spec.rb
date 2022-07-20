require 'rails_helper'

feature 'Create service unit', '
  To manage workflow user can create service unit
' do
  context 'valid params' do
    given!(:service_category) { create(:service_category, name: 'Покраска') }
    scenario 'creates' do
      visit root_path

      click_on 'Управление категориями и услугами'

      click_on 'Покраска'

      click_on 'Создать услугу'

      fill_in 'Название', with: 'Покраска двери легкового автомобиля'
      click_on 'Создать'

      expect(page).to have_content "Service unit was successfully created"
    end
  end
end
