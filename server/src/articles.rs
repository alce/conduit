use crate::pb::realworld::article_service_server::{ArticleService, ArticleServiceServer};
use crate::pb::realworld::{
    Article, ArticleList, Comment, CommentList, CreateArticleRequest, CreateCommentRequest,
    DeleteArticleRequest, GetArticleFeedRequest, GetArticleRequest, ListArticlesRequest,
    ListCommentsRequest, ListTagsRequest, Profile, TagList, ToggleFavoriteArticleRequest,
    UpdateArticleRequest,
};
use std::time::SystemTime;
use tonic::{Request, Response, Status};

pub fn service() -> ArticleServiceServer<Articles> {
    ArticleServiceServer::new(Articles)
}

#[derive(Debug)]
pub struct Articles;

#[tonic::async_trait]
impl ArticleService for Articles {
    async fn list_articles(
        &self,
        _req: Request<ListArticlesRequest>,
    ) -> Result<Response<ArticleList>, Status> {
        let articles = vec![Article {
            slug: "hello-world".to_string(),
            title: "Hello World".to_string(),
            description: "Just saying hello".to_string(),
            body: "Lorem ipsums".to_string(),
            tag_list: vec!["lorem".into()],
            favorited: false,
            create_time: Some(prost_types::Timestamp::from(SystemTime::now())),
            update_time: Some(prost_types::Timestamp::from(SystemTime::now())),
            favorites_count: 4,
            author: Some(Profile {
                username: "sue".to_string(),
                bio: "".to_string(),
                image: "".to_string(),
                following: true,
            }),
        }];

        let list = ArticleList {
            articles,
            article_count: 1,
        };

        Ok(Response::new(list))
    }

    async fn get_article_feed(
        &self,
        _req: Request<GetArticleFeedRequest>,
    ) -> Result<Response<ArticleList>, Status> {
        todo!()
    }

    async fn get_article(
        &self,
        _req: Request<GetArticleRequest>,
    ) -> Result<Response<Article>, Status> {
        todo!()
    }

    async fn create_article(
        &self,
        _req: Request<CreateArticleRequest>,
    ) -> Result<Response<Article>, Status> {
        todo!()
    }

    async fn update_article(
        &self,
        _req: Request<UpdateArticleRequest>,
    ) -> Result<Response<Article>, Status> {
        todo!()
    }

    async fn delete_article(
        &self,
        _req: Request<DeleteArticleRequest>,
    ) -> Result<Response<()>, Status> {
        todo!()
    }

    async fn toggle_favorite_article(
        &self,
        _req: Request<ToggleFavoriteArticleRequest>,
    ) -> Result<Response<Article>, Status> {
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

    async fn list_tags(&self, _req: Request<ListTagsRequest>) -> Result<Response<TagList>, Status> {
        todo!()
    }
}
