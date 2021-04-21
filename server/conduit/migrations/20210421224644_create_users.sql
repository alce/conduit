CREATE TABLE users (
    user_id  UUID PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    email    TEXT NOT NULL UNIQUE,
    bio      TEXT,
    image    TEXT,
    hash     TEXT NOT NULL
);
