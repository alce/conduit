use tonic::{Request, Response, Status};

use conduit::Conduit;

use crate::pb::realworld::article_service_server::{ArticleService, ArticleServiceServer};
use crate::pb::realworld::{
    Article, ArticleList, Comment, CommentList, CreateArticleRequest, CreateCommentRequest,
    DeleteArticleRequest, DeleteCommentRequest, FavoriteArticleRequest, GetArticleRequest,
    GetFeedRequest, ListArticlesRequest, ListCommentsRequest, ListTagsRequest, TagList,
    UpdateArticleRequest,
};
use crate::status;
use std::sync::Arc;

pub fn service(conduit: Arc<Conduit>) -> ArticleServiceServer<Articles> {
    ArticleServiceServer::new(Articles { conduit })
}

#[derive(Debug)]
pub struct Articles {
    conduit: Arc<Conduit>,
}

#[tonic::async_trait]
impl ArticleService for Articles {
    async fn list(
        &self,
        _req: Request<ListArticlesRequest>,
    ) -> Result<Response<ArticleList>, Status> {
        let _articles = self.conduit.list_articles().await.map_err(status::new)?;
        todo!()
    }

    async fn get_feed(
        &self,
        _req: Request<GetFeedRequest>,
    ) -> Result<Response<ArticleList>, Status> {
        todo!()
    }

    async fn get(&self, _req: Request<GetArticleRequest>) -> Result<Response<Article>, Status> {
        todo!()
    }

    async fn create(
        &self,
        _req: Request<CreateArticleRequest>,
    ) -> Result<Response<Article>, Status> {
        todo!()
    }

    async fn update(
        &self,
        _req: Request<UpdateArticleRequest>,
    ) -> Result<Response<Article>, Status> {
        todo!()
    }

    async fn delete(&self, _req: Request<DeleteArticleRequest>) -> Result<Response<()>, Status> {
        todo!()
    }

    async fn create_comment(
        &self,
        _req: Request<CreateCommentRequest>,
    ) -> Result<Response<Comment>, Status> {
        todo!()
    }

    async fn list_comments(
        &self,
        _req: Request<ListCommentsRequest>,
    ) -> Result<Response<CommentList>, Status> {
        todo!()
    }

    async fn delete_comment(
        &self,
        _req: Request<DeleteCommentRequest>,
    ) -> Result<Response<()>, Status> {
        todo!()
    }

    async fn favorite_article(
        &self,
        _req: Request<FavoriteArticleRequest>,
    ) -> Result<Response<Article>, Status> {
        todo!()
    }

    async fn un_favorite_article(
        &self,
        _req: Request<FavoriteArticleRequest>,
    ) -> Result<Response<Article>, Status> {
        todo!()
    }

    async fn list_tags(&self, _req: Request<ListTagsRequest>) -> Result<Response<TagList>, Status> {
        todo!()
    }
}
