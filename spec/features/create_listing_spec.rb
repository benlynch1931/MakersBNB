require 'pg'

feature 'Expect to create new listings' do
  scenario 'Create a new listing' do
    visit '/'
    click_button "See Listings"
    click_button "Add New Listing"
    fill_in('title', with: 'Bedroom flat')
    fill_in('location', with: 'London')
    fill_in('price', with: '80')
    fill_in('rooms', with: '2')
    fill_in('description', with: 'Nice bedroom flat in shoreditch')
    click_button('Add')
    expect(page).to have_content "Bedroom flat"
    expect(page).to have_content "London"
    expect(page).to have_content "80"
    expect(page).to have_content "2"
    expect(page).to have_content "Nice bedroom flat in shoreditch"
  end
end
