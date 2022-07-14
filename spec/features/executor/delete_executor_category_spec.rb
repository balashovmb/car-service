require 'rails_helper'

feature 'Delete executor', '
  To manage workflow user can delete executor
' do
  given!(:executor) { create(:executor) }
  scenario 'deletes' do
    visit root_path

    click_on 'Управление исполнителями'
    click_on 'Удалить'

    expect(page).to have_content 'Executor was successfully destroyed'
  end
end
