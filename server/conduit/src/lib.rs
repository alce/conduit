use sqlx::postgres::PgPoolOptions;
use sqlx::PgPool;

pub mod articles;
pub mod error;
pub mod types;
pub mod users;

use error::ConduitError;

#[derive(Debug)]
pub struct Conduit {
    pool: PgPool,
}

impl Conduit {
    pub async fn new(database_url: &str, pool_size: u32) -> Result<Self, ConduitError> {
        assert!(pool_size > 0, "pool size must be > 0");

        Ok(Conduit {
            pool: PgPoolOptions::new()
                .max_connections(pool_size)
                .connect(database_url)
                .await?,
        })
    }
}
