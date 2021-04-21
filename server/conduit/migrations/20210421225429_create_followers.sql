CREATE TABLE followers (
    follower UUID NOT NULL REFERENCES users,
    followee UUID NOT NULL REFERENCES users,

    UNIQUE (follower, followee)
);
