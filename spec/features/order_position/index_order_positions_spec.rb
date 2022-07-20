require 'rails_helper'

feature 'Index order positions', '
  To manage workflow user can see the list of order positions in order
' do
  given!(:order) { create(:order) }
  given!(:order_position) { create(:order_position, order: order) }
  given!(:order_position2) { create(:order_position, order: order) }

  scenario 'shows list' do
    visit root_path

    click_on 'Управление заказами'

    expect(page).to have_content order_position.service_unit.name
    expect(page).to have_content order_position2.service_unit.name
  end
end
