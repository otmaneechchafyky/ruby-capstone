--Create a schema.sql file with tables that will be analogical to the structure of the classes that you created:
CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  multiplayer BOOLEAN,
  played_at_date DATE,
  item_id INT,
  FOREIGN KEY (item_id) REFERENCES items(id)
);
CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);