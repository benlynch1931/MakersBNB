CREATE TABLE listings(
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
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  Nam pellentesque magna nec viverra dapibus. Morbi odio nunc,
  dignissim lobortis augue ut, sollicitudin suscipit urna.
  Pellentesque habitant morbi tristique senectus et netus et
  malesuada fames ac turpis egestas. Sed in rutrum erat, a
  auctor dui. Praesent ut ex pharetra, aliquet odio sit amet,
  scelerisque felis.'
);
INSERT INTO listings(title, location, price_per_night, rooms, description)
VALUES(
  'Central London house',
  'London',
  120,
  4,
  'Phasellus tincidunt quam turpis, eget lobortis odio mattis id.
   Sed id scelerisque mauris. Vivamus felis felis, viverra in
   dolor in, euismod pretium turpis. Etiam pharetra ipsum vitae
   imperdiet efficitur. Aenean quis malesuada turpis.'
);
