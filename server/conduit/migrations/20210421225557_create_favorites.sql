CREATE TABLE favorites (
    user_id    UUID NOT NULL REFERENCES users,
    article_id UUID NOT NULL REFERENCES articles,

    UNIQUE (user_id, article_id)
);
