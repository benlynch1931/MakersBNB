
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  tel_number INT,
  password VARCHAR(140)
);

INSERT INTO users(first_name, last_name, email, tel_number, password)
VALUES(
  'John',
  'Smith',
  'test@example',
  01647475367,
  'johnspassword1234'
);

INSERT INTO users(first_name, last_name, email, tel_number, password)
VALUES(
  'Barry',
  'Johnson',
  'test@example',
  01333748463,
  'barryspassword1234'
);
