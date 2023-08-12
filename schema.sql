--Create a schema.sql file with tables that will be analogical to the structure of the classes that we created

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
  genre_id INT NOT NULL,
  author_id INT NOT NULL,
  source_id INT NOT NULL,
  label_id INT NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN,
  publisher VARCHAR(255),
  cover_state VARCHAR(255),
  FOREIGN KEY (label_id) REFERENCES labels(id)
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (source_id) REFERENCES sources(id),
);

-- Create the 'labels' table
CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255)
);
