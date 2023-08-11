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
