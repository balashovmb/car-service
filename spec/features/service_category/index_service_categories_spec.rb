require 'rails_helper'

feature 'Index service categories', '
  To manage workflow user can see the list of service categories
' do
  given!(:service_category) { create(:service_category) }
  given!(:service_category2) { create(:service_category, name: 'Кузовные работы') }
  scenario 'shows list of categories' do
    visit root_path

    click_on 'Управление категориями и услугами'

    expect(page).to have_content 'Покраска'
    expect(page).to have_content 'Кузовные работы'
  end
end
