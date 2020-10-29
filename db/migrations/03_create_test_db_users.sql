CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  phone_no VARCHAR(11),
  password VARCHAR(140)
);

INSERT INTO users(first_name, last_name, email, phone_no, password)
VALUES(
  'John',
  'Smith',
  'john@example.com',
  '01647475367',
  'johnspassword1234'
);

INSERT INTO users(first_name, last_name, email, phone_no, password)
VALUES(
  'Barry',
  'Johnson',
  'barry@example.com',
  '01333748463',
  'barryspassword1234'
);
