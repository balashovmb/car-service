require 'rails_helper'

feature 'Edit order', '
  To manage workflow user can edit order
' do
  given!(:order) { create(:order) }
  scenario 'changes customer name' do
    visit root_path

    click_on 'Управление заказами'
    click_on 'Изменить'

    fill_in 'Заказчик', with: 'Vitalik Buterin'

    click_on 'Изменить'

    expect(page).to have_content 'Order was successfully updated'
    expect(page).to have_content 'Vitalik Buterin'
    expect(page).not_to have_content 'Bill Gates'
  end
end
