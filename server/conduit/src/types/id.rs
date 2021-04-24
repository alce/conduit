use std::convert::TryFrom;
use std::ops::Deref;

use serde::{Deserialize, Serialize};
use sqlx::postgres::PgValueRef;
use sqlx::{Decode, Postgres};
use uuid::Uuid;

use crate::error::{FieldError, FieldErrorKind};

#[derive(Debug, Serialize, Deserialize, Copy, Clone, Eq, PartialEq, Ord, PartialOrd, Hash)]
pub struct Id(Uuid);

impl Id {
    pub fn new() -> Self {
        Id(Uuid::new_v4())
    }

    pub const fn anonymous() -> Self {
        Id(Uuid::nil())
    }
}

impl Decode<'_, Postgres> for Id {
    fn decode(
        value: PgValueRef<'_>,
    ) -> Result<Self, Box<dyn std::error::Error + Send + Sync + 'static>> {
        <Uuid as Decode<'_, Postgres>>::decode(value).map(Id)
    }
}

impl Deref for Id {
    type Target = Uuid;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl TryFrom<&str> for Id {
    type Error = FieldError;

    fn try_from(value: &str) -> Result<Self, Self::Error> {
        Uuid::parse_str(value)
            .map_err(|_| FieldError {
                name: "id".to_string(),
                kind: FieldErrorKind::InvalidFormat,
            })
            .map(Id)
    }
}
