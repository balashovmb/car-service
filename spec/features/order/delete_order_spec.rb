require 'rails_helper'

feature 'Delete order', '
  To manage workflow user can delete order
' do
  given!(:order) { create(:order) }
  scenario 'deletes' do
    visit root_path

    click_on 'Управление заказами'
    click_on 'Удалить'

    expect(page).to have_content 'Order was successfully destroyed'
  end
end
