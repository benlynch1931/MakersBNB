require 'pg'

class User
  def self.create(first_name:, last_name:, email:, phone_no:, password:)
    connection = PG.connect(dbname: 'makers_bnb_manager_test')
    result = connection.query("INSERT INTO users (first_name, last_name, email, phone_no, password) VALUES('#{first_name}', '#{last_name}', '#{email}', '#{phone_no}', '#{password}') RETURNING id, email;")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.find(email:)
    return nil unless email
    connection = PG.connect(dbname: 'makers_bnb_manager_test')
    result = connection.query("SELECT * FROM users WHERE email = '#{email}'")
    return nil unless result.any?
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end
end
