require 'pg'

feature 'Expect to see welcome message' do
  scenario 'Welcome text visible on homepage' do
    visit '/'
    expect(page).to have_content "Welcome to Makers BnB"
  end
end

feature 'Expect button to redirect to listings page' do
  scenario 'user clicks button and sees all listings' do
    visit '/'
    click_button "Submit"
    expect(page).to have_content ('All listings')
  end
end

feature 'Expect listings page to show property fields and details' do
  scenario 'Property fields show' do
    visit '/'
    click_button "Submit"
    expect(page).to have_content ('Property name: House 1')
    expect(page).to have_content ('Property description: A house for rent')
    expect(page).to have_content ('Property location: London')
    expect(page).to have_content ('Price per night: £50')
    expect(page).to have_content ('Rooms: 2')
  end
end
