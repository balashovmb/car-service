require 'rails_helper'

feature 'Index service categories', '
  To manage workflow user can see the list of service categories
' do
given!(:executor) { create(:executor) }
given!(:executor2) { create(:executor, name: 'Илон Маск') }
  scenario 'shows list of executors' do
    visit root_path

    click_on 'Управление исполнителями'

    expect(page).to have_content 'Илон Маск'
    expect(page).to have_content 'Иван Иванов'
  end
end
