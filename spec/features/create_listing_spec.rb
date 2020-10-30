require 'pg'

feature 'Expect to create new listings' do
  scenario 'Create a new listing' do
    user = User.create(first_name: 'josy', last_name: 'macdonald', email: 'josh@example.com', phone_no: '47899704899', password: 'poaqwes')
    visit '/'
    click_button("login")
    # save_and_open_page
    click_button("login")
    fill_in('email', with: 'josh@example.com')
    fill_in('password', with: 'poaqwes')
    click_button('login')
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
    expect(page).to have_content "josy macdonald"
  end
end

feature 'Stops users that are not signed up from creating new listings' do
  scenario 'redirects to login page' do
    visit '/'
    click_button "See Listings"
    click_button "Add New Listing"
    expect(current_path).to eq '/options/login'
  end
end
