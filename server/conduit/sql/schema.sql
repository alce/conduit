DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS articles;
DROP TABLE IF EXISTS users;

CREATE EXTENSION IF NOT EXISTS citext;

CREATE TABLE users (
    id       UUID PRIMARY KEY,
    email    CITEXT NOT NULL UNIQUE,
    username CITEXT NOT NULL UNIQUE,
    hash     TEXT NOT NULL,
    bio      TEXT,
    image    TEXT
);

CREATE TABLE articles (
    id             UUID PRIMARY KEY,
    slug           CITEXT NOT NULL UNIQUE,
    title          TEXT NOT NULL,
    body           TEXT NOT NULL,
    description    TEXT NOT NULL,
    favorite_count INTEGER NOT NULL,
    tags           TEXT[] NOT NULL,
    create_time    TIMESTAMPTZ NOT NULL,
    update_time    TIMESTAMPTZ NOT NULL,
    author_id      UUID NOT NULL REFERENCES users ON DELETE CASCADE
);

CREATE TABLE comments (
    id           UUID PRIMARY KEY,
    body         TEXT NOT NULL,
    create_time  TIMESTAMPTZ NOT NULL,
    update_time  TIMESTAMPTZ NOT NULL,
    article_id   UUID REFERENCES articles ON DELETE CASCADE,
    author_id    UUID REFERENCES users ON DELETE CASCADE
);