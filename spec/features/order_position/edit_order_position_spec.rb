require 'rails_helper'

feature 'Edit order position', '
  To manage workflow user can edit order position
' do
  given!(:order_position) { create(:order_position) }
  given!(:executor) { create(:executor, name: 'Linus Torvalds') }
  scenario 'changes executor' do
    visit root_path

    click_on 'Управление заказами'
    click_on 'Изменить'
    click_on 'Отредактировать'

    select "Linus Torvalds", from: "order_position[executor_id]"

    click_on 'Изменить'

    expect(page).to have_content 'Order position was successfully updated'
    expect(page).to have_content 'Linus Torvalds'

    within '#order_positions' do
      expect(page).not_to have_content 'Иван Иванов'
    end
  end
end
