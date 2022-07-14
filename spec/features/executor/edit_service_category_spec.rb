require 'rails_helper'

feature 'Edit service category', '
  To manage workflow user can edit service category
' do
  given!(:executor) { create(:executor) }
  scenario 'changes name' do
    visit root_path

    click_on 'Управление исполнителями'
    click_on 'Изменить'

    fill_in 'Имя', with: 'Илон Маск'

    click_on 'Изменить'

    expect(page).to have_content 'Executor was successfully updated'
    expect(page).not_to have_content 'Иван Иванов'
    expect(page).to have_content 'Илон Маск'
  end
end
