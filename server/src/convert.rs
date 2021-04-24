use std::convert::TryFrom;
use std::time::SystemTime;

use conduit::articles::{
    Article, Comment, CreateArticleArgs, GetFeedArgs, ListArticlesArgs, UpdateArticleArgs,
};
use conduit::error::FieldError;
use conduit::types::{ArticleTitle, Email, Password, Token, Username};
use conduit::users::{CreateUserArgs, LoginArgs, Profile, UpdateProfileArgs, User};
use conduit::{DEFAULT_RESULT_LIST_LENGTH, MAX_RESULT_LIST_LENGTH};
use prost_types::Timestamp;

use crate::pb::{
    self, CreateArticleRequest, CreateUserRequest, GetFeedRequest, ListArticlesRequest,
    LoginRequest, UpdateArticleRequest, UpdateProfileRequest,
};

impl TryFrom<CreateUserRequest> for CreateUserArgs {
    type Error = FieldError;

    fn try_from(req: CreateUserRequest) -> Result<Self, Self::Error> {
        Ok(CreateUserArgs {
            username: Username::new(req.username, "user")?,
            email: Email::new(req.email, "user")?,
            password: Password::new(req.password, "user")?,
        })
    }
}

impl TryFrom<LoginRequest> for LoginArgs {
    type Error = FieldError;

    fn try_from(req: LoginRequest) -> Result<Self, Self::Error> {
        Ok(LoginArgs {
            email: Email::new(req.email, "user")?,
            password: Password::new(req.password, "password")?,
        })
    }
}

impl TryFrom<UpdateProfileRequest> for UpdateProfileArgs {
    type Error = FieldError;

    fn try_from(req: UpdateProfileRequest) -> Result<Self, Self::Error> {
        let username = if let Some(username) = req.username {
            Some(Username::new(username, "user")?)
        } else {
            None
        };

        let email = if let Some(email) = req.email {
            Some(Email::new(email, "user")?)
        } else {
            None
        };

        Ok(UpdateProfileArgs {
            username,
            email,
            bio: req.bio,
            image: req.image,
        })
    }
}

impl From<ListArticlesRequest> for ListArticlesArgs {
    fn from(req: ListArticlesRequest) -> Self {
        let limit = if let Some(n) = req.limit {
            i64::from(n).clamp(1, MAX_RESULT_LIST_LENGTH)
        } else {
            DEFAULT_RESULT_LIST_LENGTH
        };

        ListArticlesArgs {
            limit,
            offset: req.offset.unwrap_or(0) as i64,
            tag: req.tag,
            author: req.author,
            favorited: req.favorited,
        }
    }
}

impl From<GetFeedRequest> for GetFeedArgs {
    fn from(req: GetFeedRequest) -> Self {
        let limit = if let Some(n) = req.limit {
            i64::from(n).clamp(1, MAX_RESULT_LIST_LENGTH)
        } else {
            DEFAULT_RESULT_LIST_LENGTH
        };

        GetFeedArgs {
            limit,
            offset: req.offset.unwrap_or(0) as i64,
        }
    }
}

impl TryFrom<CreateArticleRequest> for CreateArticleArgs {
    type Error = FieldError;

    fn try_from(req: CreateArticleRequest) -> Result<Self, Self::Error> {
        Ok(CreateArticleArgs {
            title: ArticleTitle::new(req.title)?,
            description: req.description,
            body: req.body,
            tags: req.tag_list,
        })
    }
}

impl TryFrom<UpdateArticleRequest> for UpdateArticleArgs {
    type Error = FieldError;

    fn try_from(req: UpdateArticleRequest) -> Result<Self, Self::Error> {
        let title = if let Some(title) = req.title {
            Some(ArticleTitle::new(title)?)
        } else {
            None
        };

        Ok(UpdateArticleArgs {
            slug: req.slug,
            title,
            description: req.description,
            body: req.body,
        })
    }
}

impl From<(User, Token)> for pb::User {
    fn from(tup: (User, Token)) -> Self {
        pb::User {
            token: tup.1.into_string(),
            username: tup.0.username,
            email: tup.0.email,
            bio: tup.0.bio,
            image: tup.0.image,
        }
    }
}

impl From<Profile> for pb::Profile {
    fn from(p: Profile) -> Self {
        pb::Profile {
            username: p.username,
            bio: p.bio,
            image: p.image,
            following: p.following,
        }
    }
}

impl From<Article> for pb::Article {
    fn from(article: Article) -> Self {
        pb::Article {
            slug: article.slug,
            title: article.title,
            description: article.description,
            body: article.body,
            tag_list: article.tags,
            favorited: article.favorited,
            created_at: Some(Timestamp::from(SystemTime::from(article.create_time))),
            updated_at: Some(Timestamp::from(SystemTime::from(article.update_time))),
            favorites_count: article.favorites_count,
            author: Some(pb::Profile::from(article.author)),
        }
    }
}
impl From<Comment> for pb::Comment {
    fn from(comment: Comment) -> Self {
        pb::Comment {
            id: comment.comment_id.to_string(),
            body: comment.body,
            created_at: Some(Timestamp::from(SystemTime::from(comment.create_time))),
            updated_at: Some(Timestamp::from(SystemTime::from(comment.update_time))),
            author: Some(pb::Profile::from(comment.author)),
        }
    }
}
