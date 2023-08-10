-- Create the 'music_albums' table
CREATE TABLE music_albums (
  item_id INT NOT NULL,
  on_spotify BOOLEAN NOT NULL,
  FOREIGN KEY (item_id) REFERENCES items(id)
);

-- Create the 'genres' table
CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
);
