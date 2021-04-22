use argon2::password_hash::{HashError, HasherError, VerifyError};

#[derive(Debug)]
pub enum ConduitError {
    Validation(Vec<FieldError>),
    Unauthorized,
    Internal,
}

#[derive(Debug)]
pub struct FieldError {
    pub name: String,
    pub kind: FieldErrorKind,
}

#[derive(Debug, PartialEq)]
pub enum FieldErrorKind {
    Required,
    InvalidFormat,
    WeakPassword,
}

impl From<FieldError> for ConduitError {
    fn from(e: FieldError) -> Self {
        ConduitError::Validation(vec![e])
    }
}

impl From<sqlx::Error> for ConduitError {
    fn from(e: sqlx::Error) -> Self {
        dbg!(&e);
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
    fn from(e: jsonwebtoken::errors::Error) -> Self {
        dbg!(e);
        todo!("jwt error")
    }
}
