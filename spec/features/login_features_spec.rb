feature "Login to BananasBNB" do
  scenario 'User can see login form' do
    visit('/session')
    expect(page).to have_field("email")
    expect(page).to have_field("password")
    expect(page).to have_button("login")
  end

  scenario 'User sees their name when logged in' do
    visit('/session')
    fill_in('email', with: 'ben@example.com')
    fill_in('password', with: 'BenIsAwesom99')
    click_button('login')
    expect(page).to have_content("Welcome, Ben Lynch")
  end

  scenario 'User enters wrong email' do
    User.create("Ben", "Lynch", "ben@example.com", "07000 000007", "BenIsAwesome99")
    visit('/session')
    fill_in('email', with: 'wrong_email@example.com')
    fill_in('password', with: 'BenIsAwesome99')
    click_button('login')
    expect(page).not_to have_content("Welcome, Ben Lynch")
    expect(page).to have_content("Please check your email or password.")
  end

  scenario 'User enters wrong password' do
    User.create("Ben", "Lynch", "ben@example.com", "07000 000007", "BenIsAwesome99")
    visit('/session')
    fill_in('email', with: 'ben@example.com')
    fill_in('password', with: 'MaiaraIsAwesome99')
    click_button('login')
    expect(page).not_to have_content("Welcome, Ben Lynch")
    expect(page).to have_content("Please check your email or password.")
  end

end
