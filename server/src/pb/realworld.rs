#[derive(Clone, PartialEq, ::prost::Message)]
pub struct Profile {
    #[prost(string, tag = "1")]
    pub username: ::prost::alloc::string::String,
    #[prost(string, tag = "2")]
    pub bio: ::prost::alloc::string::String,
    #[prost(string, tag = "3")]
    pub image: ::prost::alloc::string::String,
    #[prost(bool, tag = "4")]
    pub following: bool,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct User {
    #[prost(string, tag = "1")]
    pub token: ::prost::alloc::string::String,
    #[prost(string, tag = "2")]
    pub username: ::prost::alloc::string::String,
    #[prost(string, tag = "3")]
    pub email: ::prost::alloc::string::String,
    #[prost(string, tag = "4")]
    pub bio: ::prost::alloc::string::String,
    #[prost(string, tag = "5")]
    pub image: ::prost::alloc::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct Article {
    #[prost(string, tag = "1")]
    pub slug: ::prost::alloc::string::String,
    #[prost(string, tag = "2")]
    pub title: ::prost::alloc::string::String,
    #[prost(string, tag = "3")]
    pub description: ::prost::alloc::string::String,
    #[prost(string, tag = "4")]
    pub body: ::prost::alloc::string::String,
    #[prost(string, repeated, tag = "5")]
    pub tag_list: ::prost::alloc::vec::Vec<::prost::alloc::string::String>,
    #[prost(bool, tag = "6")]
    pub favorited: bool,
    #[prost(message, optional, tag = "7")]
    pub create_time: ::core::option::Option<::prost_types::Timestamp>,
    #[prost(message, optional, tag = "8")]
    pub update_time: ::core::option::Option<::prost_types::Timestamp>,
    #[prost(int32, tag = "9")]
    pub favorites_count: i32,
    #[prost(message, optional, tag = "10")]
    pub author: ::core::option::Option<Profile>,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct Comment {
    #[prost(int32, tag = "1")]
    pub id: i32,
    #[prost(string, tag = "2")]
    pub body: ::prost::alloc::string::String,
    #[prost(message, optional, tag = "3")]
    pub create_time: ::core::option::Option<::prost_types::Timestamp>,
    #[prost(message, optional, tag = "4")]
    pub update_time: ::core::option::Option<::prost_types::Timestamp>,
    #[prost(message, optional, tag = "5")]
    pub author: ::core::option::Option<Profile>,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct ListArticlesRequest {
    #[prost(int32, tag = "1")]
    pub limit: i32,
    #[prost(int32, tag = "2")]
    pub offset: i32,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct GetArticleFeedRequest {
    #[prost(int32, tag = "2")]
    pub limit: i32,
    #[prost(int32, tag = "3")]
    pub offset: i32,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct ArticleList {
    #[prost(message, repeated, tag = "1")]
    pub articles: ::prost::alloc::vec::Vec<Article>,
    #[prost(int32, tag = "2")]
    pub article_count: i32,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct CreateArticleRequest {
    #[prost(message, optional, tag = "2")]
    pub article: ::core::option::Option<Article>,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct DeleteArticleRequest {
    #[prost(string, tag = "1")]
    pub slug: ::prost::alloc::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct GetArticleRequest {
    #[prost(string, tag = "1")]
    pub slug: ::prost::alloc::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct ToggleFavoriteArticleRequest {
    #[prost(string, tag = "1")]
    pub slug: ::prost::alloc::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct UpdateArticleRequest {
    #[prost(message, optional, tag = "1")]
    pub article: ::core::option::Option<Article>,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct ListCommentsRequest {
    #[prost(string, tag = "1")]
    pub slug: ::prost::alloc::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct CommentList {
    #[prost(message, repeated, tag = "1")]
    pub comments: ::prost::alloc::vec::Vec<Comment>,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct CreateCommentRequest {
    #[prost(string, tag = "1")]
    pub slug: ::prost::alloc::string::String,
    #[prost(string, tag = "2")]
    pub body: ::prost::alloc::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct DeleteCommentRequest {
    #[prost(string, tag = "1")]
    pub slug: ::prost::alloc::string::String,
    #[prost(int32, tag = "2")]
    pub id: i32,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct ListTagsRequest {}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct TagList {
    #[prost(string, repeated, tag = "1")]
    pub tags: ::prost::alloc::vec::Vec<::prost::alloc::string::String>,
}
#[doc = r" Generated server implementations."]
pub mod article_service_server {
    #![allow(unused_variables, dead_code, missing_docs)]
    use tonic::codegen::*;
    #[doc = "Generated trait containing gRPC methods that should be implemented for use with ArticleServiceServer."]
    #[async_trait]
    pub trait ArticleService: Send + Sync + 'static {
        async fn list_articles(
            &self,
            request: tonic::Request<super::ListArticlesRequest>,
        ) -> Result<tonic::Response<super::ArticleList>, tonic::Status>;
        async fn get_article_feed(
            &self,
            request: tonic::Request<super::GetArticleFeedRequest>,
        ) -> Result<tonic::Response<super::ArticleList>, tonic::Status>;
        async fn get_article(
            &self,
            request: tonic::Request<super::GetArticleRequest>,
        ) -> Result<tonic::Response<super::Article>, tonic::Status>;
        async fn create_article(
            &self,
            request: tonic::Request<super::CreateArticleRequest>,
        ) -> Result<tonic::Response<super::Article>, tonic::Status>;
        async fn update_article(
            &self,
            request: tonic::Request<super::UpdateArticleRequest>,
        ) -> Result<tonic::Response<super::Article>, tonic::Status>;
        async fn delete_article(
            &self,
            request: tonic::Request<super::DeleteArticleRequest>,
        ) -> Result<tonic::Response<()>, tonic::Status>;
        async fn toggle_favorite_article(
            &self,
            request: tonic::Request<super::ToggleFavoriteArticleRequest>,
        ) -> Result<tonic::Response<super::Article>, tonic::Status>;
        async fn create_comment(
            &self,
            request: tonic::Request<super::CreateCommentRequest>,
        ) -> Result<tonic::Response<super::Comment>, tonic::Status>;
        async fn list_comments(
            &self,
            request: tonic::Request<super::ListCommentsRequest>,
        ) -> Result<tonic::Response<super::CommentList>, tonic::Status>;
        async fn list_tags(
            &self,
            request: tonic::Request<super::ListTagsRequest>,
        ) -> Result<tonic::Response<super::TagList>, tonic::Status>;
    }
    #[derive(Debug)]
    pub struct ArticleServiceServer<T: ArticleService> {
        inner: _Inner<T>,
    }
    struct _Inner<T>(Arc<T>, Option<tonic::Interceptor>);
    impl<T: ArticleService> ArticleServiceServer<T> {
        pub fn new(inner: T) -> Self {
            let inner = Arc::new(inner);
            let inner = _Inner(inner, None);
            Self { inner }
        }
        pub fn with_interceptor(inner: T, interceptor: impl Into<tonic::Interceptor>) -> Self {
            let inner = Arc::new(inner);
            let inner = _Inner(inner, Some(interceptor.into()));
            Self { inner }
        }
    }
    impl<T, B> Service<http::Request<B>> for ArticleServiceServer<T>
    where
        T: ArticleService,
        B: HttpBody + Send + Sync + 'static,
        B::Error: Into<StdError> + Send + 'static,
    {
        type Response = http::Response<tonic::body::BoxBody>;
        type Error = Never;
        type Future = BoxFuture<Self::Response, Self::Error>;
        fn poll_ready(&mut self, _cx: &mut Context<'_>) -> Poll<Result<(), Self::Error>> {
            Poll::Ready(Ok(()))
        }
        fn call(&mut self, req: http::Request<B>) -> Self::Future {
            let inner = self.inner.clone();
            match req.uri().path() {
                "/realworld.ArticleService/ListArticles" => {
                    #[allow(non_camel_case_types)]
                    struct ListArticlesSvc<T: ArticleService>(pub Arc<T>);
                    impl<T: ArticleService> tonic::server::UnaryService<super::ListArticlesRequest>
                        for ListArticlesSvc<T>
                    {
                        type Response = super::ArticleList;
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::ListArticlesRequest>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).list_articles(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = ListArticlesSvc(inner);
                        let codec = tonic::codec::ProstCodec::default();
                        let mut grpc = if let Some(interceptor) = interceptor {
                            tonic::server::Grpc::with_interceptor(codec, interceptor)
                        } else {
                            tonic::server::Grpc::new(codec)
                        };
                        let res = grpc.unary(method, req).await;
                        Ok(res)
                    };
                    Box::pin(fut)
                }
                "/realworld.ArticleService/GetArticleFeed" => {
                    #[allow(non_camel_case_types)]
                    struct GetArticleFeedSvc<T: ArticleService>(pub Arc<T>);
                    impl<T: ArticleService>
                        tonic::server::UnaryService<super::GetArticleFeedRequest>
                        for GetArticleFeedSvc<T>
                    {
                        type Response = super::ArticleList;
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::GetArticleFeedRequest>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).get_article_feed(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = GetArticleFeedSvc(inner);
                        let codec = tonic::codec::ProstCodec::default();
                        let mut grpc = if let Some(interceptor) = interceptor {
                            tonic::server::Grpc::with_interceptor(codec, interceptor)
                        } else {
                            tonic::server::Grpc::new(codec)
                        };
                        let res = grpc.unary(method, req).await;
                        Ok(res)
                    };
                    Box::pin(fut)
                }
                "/realworld.ArticleService/GetArticle" => {
                    #[allow(non_camel_case_types)]
                    struct GetArticleSvc<T: ArticleService>(pub Arc<T>);
                    impl<T: ArticleService> tonic::server::UnaryService<super::GetArticleRequest> for GetArticleSvc<T> {
                        type Response = super::Article;
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::GetArticleRequest>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).get_article(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = GetArticleSvc(inner);
                        let codec = tonic::codec::ProstCodec::default();
                        let mut grpc = if let Some(interceptor) = interceptor {
                            tonic::server::Grpc::with_interceptor(codec, interceptor)
                        } else {
                            tonic::server::Grpc::new(codec)
                        };
                        let res = grpc.unary(method, req).await;
                        Ok(res)
                    };
                    Box::pin(fut)
                }
                "/realworld.ArticleService/CreateArticle" => {
                    #[allow(non_camel_case_types)]
                    struct CreateArticleSvc<T: ArticleService>(pub Arc<T>);
                    impl<T: ArticleService> tonic::server::UnaryService<super::CreateArticleRequest>
                        for CreateArticleSvc<T>
                    {
                        type Response = super::Article;
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::CreateArticleRequest>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).create_article(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = CreateArticleSvc(inner);
                        let codec = tonic::codec::ProstCodec::default();
                        let mut grpc = if let Some(interceptor) = interceptor {
                            tonic::server::Grpc::with_interceptor(codec, interceptor)
                        } else {
                            tonic::server::Grpc::new(codec)
                        };
                        let res = grpc.unary(method, req).await;
                        Ok(res)
                    };
                    Box::pin(fut)
                }
                "/realworld.ArticleService/UpdateArticle" => {
                    #[allow(non_camel_case_types)]
                    struct UpdateArticleSvc<T: ArticleService>(pub Arc<T>);
                    impl<T: ArticleService> tonic::server::UnaryService<super::UpdateArticleRequest>
                        for UpdateArticleSvc<T>
                    {
                        type Response = super::Article;
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::UpdateArticleRequest>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).update_article(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = UpdateArticleSvc(inner);
                        let codec = tonic::codec::ProstCodec::default();
                        let mut grpc = if let Some(interceptor) = interceptor {
                            tonic::server::Grpc::with_interceptor(codec, interceptor)
                        } else {
                            tonic::server::Grpc::new(codec)
                        };
                        let res = grpc.unary(method, req).await;
                        Ok(res)
                    };
                    Box::pin(fut)
                }
                "/realworld.ArticleService/DeleteArticle" => {
                    #[allow(non_camel_case_types)]
                    struct DeleteArticleSvc<T: ArticleService>(pub Arc<T>);
                    impl<T: ArticleService> tonic::server::UnaryService<super::DeleteArticleRequest>
                        for DeleteArticleSvc<T>
                    {
                        type Response = ();
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::DeleteArticleRequest>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).delete_article(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = DeleteArticleSvc(inner);
                        let codec = tonic::codec::ProstCodec::default();
                        let mut grpc = if let Some(interceptor) = interceptor {
                            tonic::server::Grpc::with_interceptor(codec, interceptor)
                        } else {
                            tonic::server::Grpc::new(codec)
                        };
                        let res = grpc.unary(method, req).await;
                        Ok(res)
                    };
                    Box::pin(fut)
                }
                "/realworld.ArticleService/ToggleFavoriteArticle" => {
                    #[allow(non_camel_case_types)]
                    struct ToggleFavoriteArticleSvc<T: ArticleService>(pub Arc<T>);
                    impl<T: ArticleService>
                        tonic::server::UnaryService<super::ToggleFavoriteArticleRequest>
                        for ToggleFavoriteArticleSvc<T>
                    {
                        type Response = super::Article;
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::ToggleFavoriteArticleRequest>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut =
                                async move { (*inner).toggle_favorite_article(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = ToggleFavoriteArticleSvc(inner);
                        let codec = tonic::codec::ProstCodec::default();
                        let mut grpc = if let Some(interceptor) = interceptor {
                            tonic::server::Grpc::with_interceptor(codec, interceptor)
                        } else {
                            tonic::server::Grpc::new(codec)
                        };
                        let res = grpc.unary(method, req).await;
                        Ok(res)
                    };
                    Box::pin(fut)
                }
                "/realworld.ArticleService/CreateComment" => {
                    #[allow(non_camel_case_types)]
                    struct CreateCommentSvc<T: ArticleService>(pub Arc<T>);
                    impl<T: ArticleService> tonic::server::UnaryService<super::CreateCommentRequest>
                        for CreateCommentSvc<T>
                    {
                        type Response = super::Comment;
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::CreateCommentRequest>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).create_comment(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = CreateCommentSvc(inner);
                        let codec = tonic::codec::ProstCodec::default();
                        let mut grpc = if let Some(interceptor) = interceptor {
                            tonic::server::Grpc::with_interceptor(codec, interceptor)
                        } else {
                            tonic::server::Grpc::new(codec)
                        };
                        let res = grpc.unary(method, req).await;
                        Ok(res)
                    };
                    Box::pin(fut)
                }
                "/realworld.ArticleService/ListComments" => {
                    #[allow(non_camel_case_types)]
                    struct ListCommentsSvc<T: ArticleService>(pub Arc<T>);
                    impl<T: ArticleService> tonic::server::UnaryService<super::ListCommentsRequest>
                        for ListCommentsSvc<T>
                    {
                        type Response = super::CommentList;
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::ListCommentsRequest>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).list_comments(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = ListCommentsSvc(inner);
                        let codec = tonic::codec::ProstCodec::default();
                        let mut grpc = if let Some(interceptor) = interceptor {
                            tonic::server::Grpc::with_interceptor(codec, interceptor)
                        } else {
                            tonic::server::Grpc::new(codec)
                        };
                        let res = grpc.unary(method, req).await;
                        Ok(res)
                    };
                    Box::pin(fut)
                }
                "/realworld.ArticleService/ListTags" => {
                    #[allow(non_camel_case_types)]
                    struct ListTagsSvc<T: ArticleService>(pub Arc<T>);
                    impl<T: ArticleService> tonic::server::UnaryService<super::ListTagsRequest> for ListTagsSvc<T> {
                        type Response = super::TagList;
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::ListTagsRequest>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).list_tags(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = ListTagsSvc(inner);
                        let codec = tonic::codec::ProstCodec::default();
                        let mut grpc = if let Some(interceptor) = interceptor {
                            tonic::server::Grpc::with_interceptor(codec, interceptor)
                        } else {
                            tonic::server::Grpc::new(codec)
                        };
                        let res = grpc.unary(method, req).await;
                        Ok(res)
                    };
                    Box::pin(fut)
                }
                _ => Box::pin(async move {
                    Ok(http::Response::builder()
                        .status(200)
                        .header("grpc-status", "12")
                        .header("content-type", "application/grpc")
                        .body(tonic::body::BoxBody::empty())
                        .unwrap())
                }),
            }
        }
    }
    impl<T: ArticleService> Clone for ArticleServiceServer<T> {
        fn clone(&self) -> Self {
            let inner = self.inner.clone();
            Self { inner }
        }
    }
    impl<T: ArticleService> Clone for _Inner<T> {
        fn clone(&self) -> Self {
            Self(self.0.clone(), self.1.clone())
        }
    }
    impl<T: std::fmt::Debug> std::fmt::Debug for _Inner<T> {
        fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
            write!(f, "{:?}", self.0)
        }
    }
    impl<T: ArticleService> tonic::transport::NamedService for ArticleServiceServer<T> {
        const NAME: &'static str = "realworld.ArticleService";
    }
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct LoginRequest {
    #[prost(string, tag = "1")]
    pub email: ::prost::alloc::string::String,
    #[prost(string, tag = "2")]
    pub password: ::prost::alloc::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct SignupRequest {
    #[prost(string, tag = "1")]
    pub username: ::prost::alloc::string::String,
    #[prost(string, tag = "2")]
    pub email: ::prost::alloc::string::String,
    #[prost(string, tag = "3")]
    pub password: ::prost::alloc::string::String,
}
#[doc = r" Generated server implementations."]
pub mod auth_service_server {
    #![allow(unused_variables, dead_code, missing_docs)]
    use tonic::codegen::*;
    #[doc = "Generated trait containing gRPC methods that should be implemented for use with AuthServiceServer."]
    #[async_trait]
    pub trait AuthService: Send + Sync + 'static {
        async fn login(
            &self,
            request: tonic::Request<super::LoginRequest>,
        ) -> Result<tonic::Response<super::User>, tonic::Status>;
        async fn signup(
            &self,
            request: tonic::Request<super::SignupRequest>,
        ) -> Result<tonic::Response<super::User>, tonic::Status>;
    }
    #[derive(Debug)]
    pub struct AuthServiceServer<T: AuthService> {
        inner: _Inner<T>,
    }
    struct _Inner<T>(Arc<T>, Option<tonic::Interceptor>);
    impl<T: AuthService> AuthServiceServer<T> {
        pub fn new(inner: T) -> Self {
            let inner = Arc::new(inner);
            let inner = _Inner(inner, None);
            Self { inner }
        }
        pub fn with_interceptor(inner: T, interceptor: impl Into<tonic::Interceptor>) -> Self {
            let inner = Arc::new(inner);
            let inner = _Inner(inner, Some(interceptor.into()));
            Self { inner }
        }
    }
    impl<T, B> Service<http::Request<B>> for AuthServiceServer<T>
    where
        T: AuthService,
        B: HttpBody + Send + Sync + 'static,
        B::Error: Into<StdError> + Send + 'static,
    {
        type Response = http::Response<tonic::body::BoxBody>;
        type Error = Never;
        type Future = BoxFuture<Self::Response, Self::Error>;
        fn poll_ready(&mut self, _cx: &mut Context<'_>) -> Poll<Result<(), Self::Error>> {
            Poll::Ready(Ok(()))
        }
        fn call(&mut self, req: http::Request<B>) -> Self::Future {
            let inner = self.inner.clone();
            match req.uri().path() {
                "/realworld.AuthService/Login" => {
                    #[allow(non_camel_case_types)]
                    struct LoginSvc<T: AuthService>(pub Arc<T>);
                    impl<T: AuthService> tonic::server::UnaryService<super::LoginRequest> for LoginSvc<T> {
                        type Response = super::User;
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::LoginRequest>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).login(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = LoginSvc(inner);
                        let codec = tonic::codec::ProstCodec::default();
                        let mut grpc = if let Some(interceptor) = interceptor {
                            tonic::server::Grpc::with_interceptor(codec, interceptor)
                        } else {
                            tonic::server::Grpc::new(codec)
                        };
                        let res = grpc.unary(method, req).await;
                        Ok(res)
                    };
                    Box::pin(fut)
                }
                "/realworld.AuthService/Signup" => {
                    #[allow(non_camel_case_types)]
                    struct SignupSvc<T: AuthService>(pub Arc<T>);
                    impl<T: AuthService> tonic::server::UnaryService<super::SignupRequest> for SignupSvc<T> {
                        type Response = super::User;
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::SignupRequest>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).signup(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = SignupSvc(inner);
                        let codec = tonic::codec::ProstCodec::default();
                        let mut grpc = if let Some(interceptor) = interceptor {
                            tonic::server::Grpc::with_interceptor(codec, interceptor)
                        } else {
                            tonic::server::Grpc::new(codec)
                        };
                        let res = grpc.unary(method, req).await;
                        Ok(res)
                    };
                    Box::pin(fut)
                }
                _ => Box::pin(async move {
                    Ok(http::Response::builder()
                        .status(200)
                        .header("grpc-status", "12")
                        .header("content-type", "application/grpc")
                        .body(tonic::body::BoxBody::empty())
                        .unwrap())
                }),
            }
        }
    }
    impl<T: AuthService> Clone for AuthServiceServer<T> {
        fn clone(&self) -> Self {
            let inner = self.inner.clone();
            Self { inner }
        }
    }
    impl<T: AuthService> Clone for _Inner<T> {
        fn clone(&self) -> Self {
            Self(self.0.clone(), self.1.clone())
        }
    }
    impl<T: std::fmt::Debug> std::fmt::Debug for _Inner<T> {
        fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
            write!(f, "{:?}", self.0)
        }
    }
    impl<T: AuthService> tonic::transport::NamedService for AuthServiceServer<T> {
        const NAME: &'static str = "realworld.AuthService";
    }
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct GetCurrentUserRequest {}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct UpdateUserRequest {
    #[prost(message, optional, tag = "1")]
    pub user: ::core::option::Option<User>,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct GetProfileRequest {
    #[prost(string, tag = "1")]
    pub username: ::prost::alloc::string::String,
}
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct ToggleFollowUserRequest {
    #[prost(string, tag = "1")]
    pub username: ::prost::alloc::string::String,
}
#[doc = r" Generated server implementations."]
pub mod user_service_server {
    #![allow(unused_variables, dead_code, missing_docs)]
    use tonic::codegen::*;
    #[doc = "Generated trait containing gRPC methods that should be implemented for use with UserServiceServer."]
    #[async_trait]
    pub trait UserService: Send + Sync + 'static {
        async fn get_current_user(
            &self,
            request: tonic::Request<super::GetCurrentUserRequest>,
        ) -> Result<tonic::Response<super::User>, tonic::Status>;
        async fn update_user(
            &self,
            request: tonic::Request<super::UpdateUserRequest>,
        ) -> Result<tonic::Response<super::User>, tonic::Status>;
        async fn toggle_follow_user(
            &self,
            request: tonic::Request<super::ToggleFollowUserRequest>,
        ) -> Result<tonic::Response<super::Profile>, tonic::Status>;
        async fn get_profile(
            &self,
            request: tonic::Request<super::GetProfileRequest>,
        ) -> Result<tonic::Response<super::Profile>, tonic::Status>;
    }
    #[derive(Debug)]
    pub struct UserServiceServer<T: UserService> {
        inner: _Inner<T>,
    }
    struct _Inner<T>(Arc<T>, Option<tonic::Interceptor>);
    impl<T: UserService> UserServiceServer<T> {
        pub fn new(inner: T) -> Self {
            let inner = Arc::new(inner);
            let inner = _Inner(inner, None);
            Self { inner }
        }
        pub fn with_interceptor(inner: T, interceptor: impl Into<tonic::Interceptor>) -> Self {
            let inner = Arc::new(inner);
            let inner = _Inner(inner, Some(interceptor.into()));
            Self { inner }
        }
    }
    impl<T, B> Service<http::Request<B>> for UserServiceServer<T>
    where
        T: UserService,
        B: HttpBody + Send + Sync + 'static,
        B::Error: Into<StdError> + Send + 'static,
    {
        type Response = http::Response<tonic::body::BoxBody>;
        type Error = Never;
        type Future = BoxFuture<Self::Response, Self::Error>;
        fn poll_ready(&mut self, _cx: &mut Context<'_>) -> Poll<Result<(), Self::Error>> {
            Poll::Ready(Ok(()))
        }
        fn call(&mut self, req: http::Request<B>) -> Self::Future {
            let inner = self.inner.clone();
            match req.uri().path() {
                "/realworld.UserService/GetCurrentUser" => {
                    #[allow(non_camel_case_types)]
                    struct GetCurrentUserSvc<T: UserService>(pub Arc<T>);
                    impl<T: UserService> tonic::server::UnaryService<super::GetCurrentUserRequest>
                        for GetCurrentUserSvc<T>
                    {
                        type Response = super::User;
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::GetCurrentUserRequest>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).get_current_user(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = GetCurrentUserSvc(inner);
                        let codec = tonic::codec::ProstCodec::default();
                        let mut grpc = if let Some(interceptor) = interceptor {
                            tonic::server::Grpc::with_interceptor(codec, interceptor)
                        } else {
                            tonic::server::Grpc::new(codec)
                        };
                        let res = grpc.unary(method, req).await;
                        Ok(res)
                    };
                    Box::pin(fut)
                }
                "/realworld.UserService/UpdateUser" => {
                    #[allow(non_camel_case_types)]
                    struct UpdateUserSvc<T: UserService>(pub Arc<T>);
                    impl<T: UserService> tonic::server::UnaryService<super::UpdateUserRequest> for UpdateUserSvc<T> {
                        type Response = super::User;
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::UpdateUserRequest>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).update_user(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = UpdateUserSvc(inner);
                        let codec = tonic::codec::ProstCodec::default();
                        let mut grpc = if let Some(interceptor) = interceptor {
                            tonic::server::Grpc::with_interceptor(codec, interceptor)
                        } else {
                            tonic::server::Grpc::new(codec)
                        };
                        let res = grpc.unary(method, req).await;
                        Ok(res)
                    };
                    Box::pin(fut)
                }
                "/realworld.UserService/ToggleFollowUser" => {
                    #[allow(non_camel_case_types)]
                    struct ToggleFollowUserSvc<T: UserService>(pub Arc<T>);
                    impl<T: UserService> tonic::server::UnaryService<super::ToggleFollowUserRequest>
                        for ToggleFollowUserSvc<T>
                    {
                        type Response = super::Profile;
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::ToggleFollowUserRequest>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).toggle_follow_user(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = ToggleFollowUserSvc(inner);
                        let codec = tonic::codec::ProstCodec::default();
                        let mut grpc = if let Some(interceptor) = interceptor {
                            tonic::server::Grpc::with_interceptor(codec, interceptor)
                        } else {
                            tonic::server::Grpc::new(codec)
                        };
                        let res = grpc.unary(method, req).await;
                        Ok(res)
                    };
                    Box::pin(fut)
                }
                "/realworld.UserService/GetProfile" => {
                    #[allow(non_camel_case_types)]
                    struct GetProfileSvc<T: UserService>(pub Arc<T>);
                    impl<T: UserService> tonic::server::UnaryService<super::GetProfileRequest> for GetProfileSvc<T> {
                        type Response = super::Profile;
                        type Future = BoxFuture<tonic::Response<Self::Response>, tonic::Status>;
                        fn call(
                            &mut self,
                            request: tonic::Request<super::GetProfileRequest>,
                        ) -> Self::Future {
                            let inner = self.0.clone();
                            let fut = async move { (*inner).get_profile(request).await };
                            Box::pin(fut)
                        }
                    }
                    let inner = self.inner.clone();
                    let fut = async move {
                        let interceptor = inner.1.clone();
                        let inner = inner.0;
                        let method = GetProfileSvc(inner);
                        let codec = tonic::codec::ProstCodec::default();
                        let mut grpc = if let Some(interceptor) = interceptor {
                            tonic::server::Grpc::with_interceptor(codec, interceptor)
                        } else {
                            tonic::server::Grpc::new(codec)
                        };
                        let res = grpc.unary(method, req).await;
                        Ok(res)
                    };
                    Box::pin(fut)
                }
                _ => Box::pin(async move {
                    Ok(http::Response::builder()
                        .status(200)
                        .header("grpc-status", "12")
                        .header("content-type", "application/grpc")
                        .body(tonic::body::BoxBody::empty())
                        .unwrap())
                }),
            }
        }
    }
    impl<T: UserService> Clone for UserServiceServer<T> {
        fn clone(&self) -> Self {
            let inner = self.inner.clone();
            Self { inner }
        }
    }
    impl<T: UserService> Clone for _Inner<T> {
        fn clone(&self) -> Self {
            Self(self.0.clone(), self.1.clone())
        }
    }
    impl<T: std::fmt::Debug> std::fmt::Debug for _Inner<T> {
        fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
            write!(f, "{:?}", self.0)
        }
    }
    impl<T: UserService> tonic::transport::NamedService for UserServiceServer<T> {
        const NAME: &'static str = "realworld.UserService";
    }
}
