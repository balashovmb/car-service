require 'rails_helper'

feature 'Delete order position', '
  To manage workflow user can delete order position
' do
  given!(:order_position) { create(:order_position) }
  scenario 'deletes' do
    visit root_path

    click_on 'Управление заказами'
    click_on 'Изменить'
    click_on 'Удалить'

    expect(page).to have_content 'Order position was successfully destroyed'
  end
end
