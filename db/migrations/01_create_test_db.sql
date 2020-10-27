CREATE TABLE listings (
  id SERIAL PRIMARY KEY,
  title VARCHAR(50),
  location VARCHAR(30),
  price_per_night INT,
  rooms INT,
  description VARCHAR(600)
);

INSERT INTO listings(title, location, price_per_night, rooms, description)
VALUES(
  'Ocean View flat',
  'Southampton',
  80,
  2,
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
);
INSERT INTO listings(title, location, price_per_night, rooms, description)
VALUES(
  'Central London house',
  'London',
  120,
  4,
  'Phasellus tincidunt quam turpis, eget lobortis odio mattis id.'
);
