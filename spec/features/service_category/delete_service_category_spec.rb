require 'rails_helper'

feature 'Delete service category', '
  To manage workflow user can delete service category
' do

  given!(:service_category) {create(:service_category)}
  scenario 'deletes' do
    visit root_path

    click_on 'Управление категориями и услугами'
    click_on 'Удалить категорию'

    expect(page).to have_content 'Service category was successfully destroyed'
  end
end
