CREATE TABLE users (
    user_id  UUID PRIMARY KEY,
    username TEXT NOT NULL CONSTRAINT user_username UNIQUE,
    email    TEXT NOT NULL CONSTRAINT user_email UNIQUE,
    bio      TEXT,
    image    TEXT,
    hash     TEXT NOT NULL
);
