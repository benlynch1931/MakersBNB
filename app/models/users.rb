require 'pg'

class User
  def self.create(email:, password:)
    connection = PG.connect(dbname: 'makers_bnb_manager_test')
    result = connection.query("INSERT INTO users (email, password) VALUES('#{email}', '#{password}') RETURNING id, email;")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.find(id)
    return nil unless id
    connection = PG.connect(dbname: 'makers_bnb_manager_test')
    result = connection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(result[0]['id'], result[0]['email'])
  end

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end
end
