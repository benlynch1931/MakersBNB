# frozen_string_literal: true

require 'pg'

def reset_table
  connection = PG.connect(dbname: 'makers_bnb_manager_test')
  connection.exec('TRUNCATE listings, users RESTART IDENTITY;')
  # connection.exec('TRUNCATE users RESTART IDENTITY;')
  connection.exec("
    INSERT INTO users(first_name, last_name, email, phone_no, password)
    VALUES('John', 'Smith', 'john@example.com', 01647475367,'johnspassword1234');
    INSERT INTO users(first_name, last_name, email, phone_no, password)
    VALUES('Barry', 'Johnson', 'barry@example.com', 01333748463,'barryspassword1234');

    INSERT INTO listings(title, location, price_per_night, rooms, description, provider)
    VALUES('Ocean View flat','Southampton', 80, 2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 1);
    INSERT INTO listings(title, location, price_per_night, rooms, description, provider)
    VALUES('Central London house','London', 120, 4,'Phasellus tincidunt quam turpis, eget lobortis odio mattis id.', 1);
  ")
end

def persisted_data(id:, table:)
  connection = PG.connect(dbname: 'makers_bnb_manager_test')
  connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end
