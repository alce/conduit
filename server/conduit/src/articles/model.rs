use crate::articles::UpdateArticleArgs;
use crate::types::{DateTime, Id};
use crate::users::Profile;

#[derive(Debug)]
pub struct Article {
    pub article_id: Id,
    pub slug: String,
    pub title: String,
    pub description: String,
    pub body: String,
    pub tags: Vec<String>,
    pub favorited: bool,
    pub create_time: DateTime,
    pub update_time: DateTime,
    pub favorites_count: i32,
    pub author: Profile,
}

pub struct ArticleHead {
    pub slug: String,
    pub title: String,
    pub description: String,
    pub tags: Vec<String>,
    pub create_time: DateTime,
    pub favorites_count: i32,
    pub username: String,
    pub count: Option<i64>,
}

pub struct Comment {
    pub comment_id: Id,
    pub body: String,
    pub create_time: DateTime,
    pub update_time: DateTime,
    pub author: Profile,
}

// #[derive(Debug)]
// pub struct UpdateArticleArgs {
//     pub slug: String,
//     pub title: Option<ArticleTitle>,
//     pub description: Option<String>,
//     pub body: Option<String>,
// }

impl Article {
    // could return an option if no updates were made
    // myabe create 'args' FROM Article just to compare the args
    pub fn update(self, args: UpdateArticleArgs, now: DateTime) -> Article {
        Article {
            slug: args.title.as_ref().map(|t| t.slug()).unwrap_or(self.slug),
            title: args.title.map(|t| t.into_string()).unwrap_or(self.title),
            description: args.description.unwrap_or(self.description),
            body: args.body.unwrap_or(self.body),
            update_time: now,
            ..self
        }
    }
}
