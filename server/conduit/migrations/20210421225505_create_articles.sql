CREATE TABLE  articles (
    article_id      UUID PRIMARY KEY,
    slug            TEXT NOT NULL UNIQUE,
    title           TEXT NOT NULL,
    body            TEXT NOT NULL,
    description     TEXT NOT NULL,
    favorites_count INTEGER NOT NULL,
    tags            TEXT[] NOT NULL,
    create_time     TIMESTAMPTZ NOT NULL,
    update_time     TIMESTAMPTZ NOT NULL,
    author_id       UUID NOT NULL REFERENCES users ON DELETE CASCADE
);
