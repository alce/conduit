use crate::model::error::ConduitError;
use sqlx::postgres::PgPoolOptions;
use sqlx::PgPool;

pub mod articles;
pub mod model;
pub mod users;

mod crypto;

#[derive(Debug)]
pub struct Conduit {
    pool: PgPool,
}

impl Conduit {
    pub async fn new() -> Result<Self, ConduitError> {
        let pool = PgPoolOptions::new()
            .max_connections(5)
            .connect("postgres://localhost/conduit")
            .await?;

        Ok(Self { pool })
    }
}
