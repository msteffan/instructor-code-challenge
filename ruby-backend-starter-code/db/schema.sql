DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS movies;


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL

);

CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    title TEXT,
    user_id INTEGER REFERENCES users(id)

);
