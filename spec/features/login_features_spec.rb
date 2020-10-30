feature "Login to BananasBNB" do
  scenario 'User can see login form' do
    visit('/session/new')
    expect(page).to have_field("email")
    expect(page).to have_field("password")
    expect(page).to have_button("login")
  end

  scenario 'User sees their name when logged in' do
    visit('/session/new')
    user = User.create(first_name: 'josy', last_name: 'macdonald', email: 'ben@example.com', phone_no: '47899704899', password: 'BenIsAwesome99')

    fill_in('email', with: 'ben@example.com')
    fill_in('password', with: 'BenIsAwesome99')
    click_button('login')
    expect(page).to have_content("Welcome, josy macdonald")
  end

  scenario 'User enters wrong email' do
    User.create(first_name: "Ben", last_name: "Lynch", email: "ben@example.com", phone_no: "07000000007", password: "BenIsAwesome99")
    visit('/session/new')
    fill_in('email', with: 'wrong_email@example.com')
    fill_in('password', with: 'BenIsAwesome99')
    click_button('login')
    expect(page).not_to have_content("Welcome, Ben Lynch")
    expect(page).to have_content("Please check your email or password.")
  end

  scenario 'User enters wrong password' do
    User.create(first_name: "Ben", last_name: "Lynch", email: "ben@example.com", phone_no: "07000000007", password: "BenIsAwesome99")
    visit('/session/new')
    fill_in('email', with: 'ben@example.com')
    fill_in('password', with: 'MaiaraIsAwesome99')
    click_button('login')
    expect(page).not_to have_content("Welcome, Ben Lynch")
    expect(page).to have_content("Please check your email or password.")
  end

end
