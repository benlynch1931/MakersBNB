feature "Sign up to BananasBNB" do
  scenario 'User can see sign-up form' do
    visit('/session/new')
    expect(page).to have_field("first_name")
    expect(page).to have_field("last_name")
    expect(page).to have_field("email")
    expect(page).to have_field("phone_no")
    expect(page).to have_field("password")
    expect(page).to have_button("sign_up")
  end

  scenario 'User can input their details too sign up' do
    visit('/session/new')
    fill_in('first_name', with: 'Ben')
    fill_in('last_name', with: 'Lynch')
    fill_in('email', with: 'ben@example.com')
    fill_in('phone_no', with: '+44 1234 567890')
    fill_in('password', with: 'BenIsAwesom99')
    click_button('sign_up')
    # expect(page).to have_content("Welcome, Ben Lynch")
  end
end
