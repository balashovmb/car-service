require 'rails_helper'

feature 'Index service units', '
  To manage workflow user can see the list of service units
' do
  given(:service_category) { create(:service_category) }
  given!(:service_unit) { create(:service_unit, service_category: service_category) }
  given!(:service_unit2) { create(:service_unit, service_category: service_category, name: 'Покраска двери') }
  scenario 'changes name' do
    visit root_path

    click_on 'Управление категориями и услугами'
    click_on 'Покраска'

    expect(page).to have_content 'Покраска бампера'
    expect(page).to have_content 'Покраска двери'
  end
end
