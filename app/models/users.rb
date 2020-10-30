require 'pg'
require 'bcrypt'

class User
  def self.create(first_name:, last_name:, email:, phone_no:, password:)
    encrypted_password = BCrypt::Password.create(password)
    connection = PG.connect(dbname: 'makers_bnb_manager_test')
    result = connection.query("INSERT INTO users (first_name, last_name, email, phone_no, password) VALUES('#{first_name}', '#{last_name}', '#{email}', '#{phone_no}', '#{encrypted_password}') RETURNING id, email;")
    User.new(id: result[0]['id'], first_name: result[0]['first_name'], last_name: result[0]['last_name'], email: result[0]['email'])
  end

  def self.authenticate(email:, password:)
    return nil unless email
    connection = PG.connect(dbname: 'makers_bnb_manager_test')
    result = connection.query("SELECT * FROM users WHERE email = '#{email}'")
    return nil unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
      User.new(id: result[0]['id'], first_name: result[0]['first_name'], last_name: result[0]['last_name'], email: result[0]['email'])

  end

  attr_reader :id, :email, :first_name, :last_name

  def initialize(id:, first_name:, last_name:, email:)
    @id = id
    @email = email
    @first_name = first_name
    @last_name = last_name
  end
end
