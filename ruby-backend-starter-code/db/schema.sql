DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS movies;


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
    -- photo_url TEXT,
    -- nationality TEXT
);

CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    title TEXT,
    -- album TEXT,
    -- preview_url TEXT,
    user_id INTEGER REFERENCES users(id)

);

--
-- CREATE TABLE playlists (
--   id SERIAL PRIMARY KEY,
--   name TEXT
-- );
--
-- CREATE TABLE playlists_songs (
--   song_id INTEGER REFERENCES songs(id),
--   playlist_id INTEGER REFERENCES playlists(id)
-- );
