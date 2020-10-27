# frozen_string_literal: true

require 'pg'

def reset_table
  connection = PG.connect(dbname: 'makers_bnb_manager_test')
  connection.exec('TRUNCATE listings RESTART IDENTITY;')
  connection.exec("
    INSERT INTO listings(title, location, price_per_night, rooms, description)
    VALUES('Ocean View flat','Southampton', 80, 2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit.');
    INSERT INTO listings(title, location, price_per_night, rooms, description)
    VALUES('Central London house','London', 120, 4,'Phasellus tincidunt quam turpis, eget lobortis odio mattis id.');
  ")
end
