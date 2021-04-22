include!("realworld.rs");

pub use article_service_server::{ArticleService, ArticleServiceServer};
pub use user_service_server::{UserService, UserServiceServer};

pub mod google {
    pub mod rpc {
        include!("google.rpc.rs");
    }
}
