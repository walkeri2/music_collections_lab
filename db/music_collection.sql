DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;



CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  artist_name VARCHAR(255)
);

CREATE TABLE albums(
  id SERIAL PRIMARY KEY,
  album_name VARCHAR(255),
  album_genre VARCHAR(255),
  artist_id INT REFERENCES artists(id)
);
