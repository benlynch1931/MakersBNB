require 'pg'

feature 'Expect to create new listings' do
  scenario 'Create a new listing' do
    visit '/create_listings'
    fill_in('title', with: 'Bedroom flat')
    fill_in('location', with: 'London')
    fill_in('price', with: '80')
    fill_in('rooms', with: '2')
    fill_in('description', with: 'Nice bedroom flat in shoreditch')
    click_button('Submit')
    save_and_open_page
    # expect(current_path).to eq '/listings'
    expect(page).to have_content "Bedroom flat"
    expect(page).to have_content "London"
    expect(page).to have_content "80"
    expect(page).to have_content "2"
    expect(page).to have_content "Nice bedroom flat in shoreditch"
  end
end
