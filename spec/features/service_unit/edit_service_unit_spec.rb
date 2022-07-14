require 'rails_helper'

feature 'Delete service unit', '
  To manage workflow user can edit service unit
' do
  given!(:service_unit) { create(:service_unit) }
  scenario 'creates' do
    visit root_path

    click_on 'Управление категориями и услугами'
    click_on 'Покраска'
    click_on 'Изменить услугу'

    fill_in 'Название', with: 'Покраска двери'

    click_on 'Изменить'

    expect(page).to have_content 'Service unit was successfully updated'
    expect(page).not_to have_content 'Покраска бампера'
    expect(page).to have_content 'Покраска двери'
  end
end
