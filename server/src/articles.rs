use std::convert::TryFrom;
use std::sync::Arc;

use conduit::articles::{
    Article, CreateArticleArgs, GetFeedArgs, ListArticlesArgs, UpdateArticleArgs,
};
use conduit::types::Id;
use conduit::Conduit;
use tonic::{Request, Response, Status};

use super::get_token;
use crate::pb::{
    self, ArticleList, ArticleResponse, ArticleService, ArticleServiceServer, CommentList,
    CommentResponse, CreateArticleRequest, CreateCommentRequest, DeleteArticleRequest,
    DeleteCommentRequest, FavoriteArticleRequest, GetArticleRequest, GetFeedRequest,
    ListArticlesRequest, ListCommentsRequest, ListTagsRequest, TagList, UpdateArticleRequest,
};
use crate::status::StatusExt;

#[derive(Debug)]
pub struct Articles {
    conduit: Arc<Conduit>,
}

pub fn service(conduit: Arc<Conduit>) -> ArticleServiceServer<Articles> {
    ArticleServiceServer::new(Articles { conduit })
}

fn article_response(article: Article) -> Response<ArticleResponse> {
    Response::new(ArticleResponse {
        article: Some(pb::Article::from(article)),
    })
}

#[tonic::async_trait]
impl ArticleService for Articles {
    async fn list(
        &self,
        req: Request<ListArticlesRequest>,
    ) -> Result<Response<ArticleList>, Status> {
        println!("list!");

        let token = get_token(req.metadata()).ok();
        let args = ListArticlesArgs::from(req.into_inner());

        let articles = self
            .conduit
            .list_articles(args, token)
            .await
            .map_err(Status::from_conduit_error)?;

        Ok(Response::new(ArticleList {
            articles_count: articles.len() as i32,
            articles: articles.into_iter().map(pb::Article::from).collect(),
        }))
    }

    async fn get_feed(
        &self,
        req: Request<GetFeedRequest>,
    ) -> Result<Response<ArticleList>, Status> {
        let token = get_token(req.metadata())?;
        let args = GetFeedArgs::from(req.into_inner());

        let articles = self
            .conduit
            .get_feed(args, token)
            .await
            .map_err(Status::from_conduit_error)?;

        Ok(Response::new(ArticleList {
            articles_count: articles.len() as i32,
            articles: articles.into_iter().map(pb::Article::from).collect(),
        }))
    }

    async fn get(
        &self,
        req: Request<GetArticleRequest>,
    ) -> Result<Response<ArticleResponse>, Status> {
        let token = get_token(req.metadata()).ok();

        self.conduit
            .get_article(&req.get_ref().slug, token)
            .await
            .map(article_response)
            .map_err(Status::from_conduit_error)
    }

    async fn create(
        &self,
        req: Request<CreateArticleRequest>,
    ) -> Result<Response<ArticleResponse>, Status> {
        let token = get_token(req.metadata())?;
        let args = CreateArticleArgs::try_from(req.into_inner()).map_err(Status::bad_request)?;

        self.conduit
            .create_article(args, token)
            .await
            .map(article_response)
            .map_err(Status::from_conduit_error)
    }

    async fn update(
        &self,
        req: Request<UpdateArticleRequest>,
    ) -> Result<Response<ArticleResponse>, Status> {
        let token = get_token(req.metadata())?;
        let args = UpdateArticleArgs::try_from(req.into_inner()).map_err(Status::bad_request)?;

        self.conduit
            .update_article(args, token)
            .await
            .map(article_response)
            .map_err(Status::from_conduit_error)
    }

    async fn delete(&self, req: Request<DeleteArticleRequest>) -> Result<Response<()>, Status> {
        let token = get_token(req.metadata())?;

        self.conduit
            .delete_article(&req.get_ref().slug, token)
            .await
            .map(Response::new)
            .map_err(Status::from_conduit_error)
    }

    async fn create_comment(
        &self,
        req: Request<CreateCommentRequest>,
    ) -> Result<Response<CommentResponse>, Status> {
        let token = get_token(req.metadata())?;
        let req = req.get_ref();

        let comment = self
            .conduit
            .create_comment(&req.slug, &req.body, token)
            .await
            .map_err(Status::from_conduit_error)?;

        Ok(Response::new(CommentResponse {
            comment: Some(pb::Comment::from(comment)),
        }))
    }

    async fn list_comments(
        &self,
        req: Request<ListCommentsRequest>,
    ) -> Result<Response<CommentList>, Status> {
        let token = get_token(req.metadata()).ok();

        let comments = self
            .conduit
            .list_comments(&req.get_ref().slug, token)
            .await
            .map_err(Status::from_conduit_error)?;

        Ok(Response::new(CommentList {
            comments: comments.into_iter().map(pb::Comment::from).collect(),
        }))
    }

    async fn delete_comment(
        &self,
        req: Request<DeleteCommentRequest>,
    ) -> Result<Response<()>, Status> {
        let token = get_token(req.metadata())?;
        let id = Id::try_from(req.get_ref().id.as_str()).map_err(Status::bad_request)?;

        self.conduit
            .delete_comment(id, &req.get_ref().slug, token)
            .await
            .map(Response::new)
            .map_err(Status::from_conduit_error)
    }

    async fn favorite_article(
        &self,
        req: Request<FavoriteArticleRequest>,
    ) -> Result<Response<ArticleResponse>, Status> {
        let token = get_token(req.metadata())?;

        self.conduit
            .favorite_article(&req.get_ref().slug, token)
            .await
            .map(article_response)
            .map_err(Status::from_conduit_error)
    }

    async fn unfavorite_article(
        &self,
        req: Request<FavoriteArticleRequest>,
    ) -> Result<Response<ArticleResponse>, Status> {
        let token = get_token(req.metadata())?;

        self.conduit
            .unfavorite_article(&req.get_ref().slug, token)
            .await
            .map(article_response)
            .map_err(Status::from_conduit_error)
    }

    async fn list_tags(&self, _req: Request<ListTagsRequest>) -> Result<Response<TagList>, Status> {
        todo!()
    }
}
