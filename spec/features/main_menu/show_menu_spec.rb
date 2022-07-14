require 'rails_helper'

feature 'Show menu', '
  To manage workflow user can see main menu of App
' do
  scenario 'shows list of menu items' do
    visit root_path

    expect(page).to have_content 'Управление категориями и услугами'
  end
end
