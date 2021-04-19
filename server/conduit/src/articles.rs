use crate::model::error::ConduitError;
use crate::Conduit;

pub struct Article;

pub struct ArticleArgs;

impl Conduit {
    pub async fn list_articles(&self) -> Result<Vec<Article>, ConduitError> {
        Ok(vec![])
    }
}
