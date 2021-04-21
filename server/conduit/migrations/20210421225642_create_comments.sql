CREATE TABLE comments (
    comment_id   UUID PRIMARY KEY,
    body         TEXT NOT NULL,
    create_time  TIMESTAMPTZ NOT NULL,
    update_time  TIMESTAMPTZ NOT NULL,
    article_id   UUID REFERENCES articles ON DELETE CASCADE,
    author_id    UUID REFERENCES users ON DELETE CASCADE
);
