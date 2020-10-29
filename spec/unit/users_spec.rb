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
      persisted_data = persisted_data(table: :users, id: user.id)
      expect(users).to be_a User
      expect(users.id).to eq persisted_data.first['id']
      expect(users.email).to eq 'josh@example.com'
    end
  end
end
