require 'rails_helper'

feature 'Create order position', '
  To manage workflow user can create order position
' do
  context 'valid params' do
    given!(:order) { create(:order) }
    given!(:executor) { create(:executor) }
    given!(:service_unit) { create(:service_unit) }
    scenario 'creates' do
      visit root_path

      click_on 'Управление заказами'
      click_on 'Изменить'

      select "Иван Иванов", from: "order_position[executor_id]"
      select service_unit.name, from: "order_position[service_unit_id]"

      click_on 'Добавить'

      expect(page).to have_content "Order position was successfully created"
    end
  end
end
