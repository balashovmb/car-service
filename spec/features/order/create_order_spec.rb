require 'rails_helper'

feature 'Create order', '
  To manage workflow user can create order
' do
  context 'valid params' do
    scenario 'creates' do
      visit root_path

      click_on 'Управление заказами'
      click_on 'Создать заказ'
      fill_in 'Заказчик', with: 'Bill Gates'
      click_on 'Создать'

      expect(page).to have_content "Order was successfully created"
    end
  end
end
