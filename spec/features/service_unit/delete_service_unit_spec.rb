require 'rails_helper'

feature 'Delete service unit', '
  To manage workflow user can delete service unit
' do
  given!(:service_unit) { create(:service_unit) }
  scenario 'deletes' do
    visit root_path

    click_on 'Управление категориями и услугами'
    click_on 'Покраска'
    click_on 'Удалить услугу'

    expect(page).to have_content 'Service unit was successfully destroyed'
  end
end
