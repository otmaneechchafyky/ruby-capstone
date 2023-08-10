-- Create the 'music_albums' table
CREATE TABLE music_albums (
  id SERIAL PRIMARY KEY,
  genre_id INT NOT NULL,
  author_id INT NOT NULL,
  source_id INT NOT NULL,
  label_id INT NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN,
  on_spotify BOOLEAN NOT NULL,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (source_id) REFERENCES sources(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);

-- Create the 'genres' table
CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);
