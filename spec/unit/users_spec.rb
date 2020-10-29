# frozen_string_literal: true

require './app/models/users.rb'
require './spec/web_helpers.rb'

describe User do
  before (:each) do
    reset_table
  end

  describe '.create' do
    it 'creates a new user' do
      users = User.create(email: 'josh@example.com', password: 'poaqwes')
      persisted_data = persisted_data(table: :users, id: users.id)
      expect(users).to be_a User
      expect(users.id).to eq persisted_data.first['id']
      expect(users.email).to eq 'josh@example.com'
    end
  end

describe '.find' do
  it 'finds a user by ID' do
    user = User.create(email: 'test@example.com', password: 'password123')
    result = User.find(id: user)

    expect(result.id).to eq user.id
    expect(result.email).to eq user.email
  end

  it 'returns nil if there is no ID given' do
    expect(User.find(nil)).to eq nil
  end
end

end
