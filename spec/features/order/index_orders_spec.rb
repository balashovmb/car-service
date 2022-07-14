require 'rails_helper'

feature 'Index service categories', '
  To manage workflow user can see the list of service categories
' do
given!(:order) { create(:order) }
given!(:order2) { create(:order, customer: 'Илон Маск') }
  scenario 'shows list of executors' do
    visit root_path

    click_on 'Управление заказами'

    expect(page).to have_content 'Илон Маск'
    expect(page).to have_content 'Bill Gates'
  end
end
