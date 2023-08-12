--Create a schema.sql file with tables that will be analogical to the structure of the classes that we created

-- Create the 'authors' table
CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

-- Create the 'labels' table
CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255)
);

-- Create the 'items' table
CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  genre VARCHAR(255),
  author VARCHAR(255),
  source VARCHAR(255),
  label VARCHAR(255),
  publish_date DATE,
  archived BOOLEAN
);

-- Create the 'books' table
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  publisher VARCHAR(255),
  cover_state VARCHAR(255),
  item_id INT,
  FOREIGN KEY (item_id) REFERENCES items(id)
);

-- Create the 'games' table
CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  multiplayer BOOLEAN,
  played_at_date DATE,
  item_id INT,
  FOREIGN KEY (item_id) REFERENCES items(id)
);
