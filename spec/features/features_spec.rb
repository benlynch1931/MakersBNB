require 'pg'

feature 'Expect to see welcome message' do
  scenario 'Welcome text visible on homepage' do
    visit '/'
    expect(page).to have_content "Welcome to Makers BnB"
  end
end

feature 'Expect buttons for logging in or signing up' do
  scenario 'Buttons are visible' do
    visit '/'
    expect(page).to have_button("login")
    expect(page).to have_button("sign_up")
  end
end

feature 'Expect button to redirect to listings page' do
  scenario 'user clicks button and sees all listings' do
    visit '/'
    click_button "See Listings"
    expect(page).to have_content ('All listings')
  end
end

feature 'Expect listings page to show property fields and details' do
  scenario 'Property fields show' do
    visit '/'
    click_button "See Listings"
    expect(page).to have_content ('Property name: Ocean View flat')
    expect(page).to have_content ('Property description: Lorem ipsum')
    expect(page).to have_content ('Property location: Southampton')
    expect(page).to have_content ('Price per night: £80/night')
    expect(page).to have_content ('Rooms: 2')
    expect(page).to have_content ('John Smith')
  end

  feature 'Expect listings page to have an add button' do
    scenario "There is an `Add new listing` button" do
      visit '/'
      click_button "See Listings"
      expect(page).to have_button("Add New Listing")
    end
  end
end
