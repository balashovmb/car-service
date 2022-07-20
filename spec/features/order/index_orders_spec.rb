require 'rails_helper'

feature 'Index orders', '
  To manage workflow user can see the list of orders
' do
given!(:order) { create(:order) }
given!(:order2) { create(:order, customer: 'Илон Маск') }
  scenario 'shows list of orders' do
    visit root_path

    click_on 'Управление заказами'

    expect(page).to have_content 'Илон Маск'
    expect(page).to have_content 'Bill Gates'
  end
end
