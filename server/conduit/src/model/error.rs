use argon2::password_hash::{HashError, HasherError, VerifyError};

#[derive(Debug)]
pub enum ConduitError {
    Validation,
    Unauthorized,
    Internal,
}

impl From<sqlx::Error> for ConduitError {
    fn from(_: sqlx::Error) -> Self {
        todo!("sqlx error")
    }
}

impl From<HasherError> for ConduitError {
    fn from(_: HasherError) -> Self {
        todo!("hasher error")
    }
}

impl From<HashError> for ConduitError {
    fn from(_: HashError) -> Self {
        todo!("hash error")
    }
}

impl From<VerifyError> for ConduitError {
    fn from(_: VerifyError) -> Self {
        todo!("verify error")
    }
}

impl From<jsonwebtoken::errors::Error> for ConduitError {
    fn from(_: jsonwebtoken::errors::Error) -> Self {
        todo!("jwt error")
    }
}
