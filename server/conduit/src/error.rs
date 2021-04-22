use std::fmt;

#[derive(Debug)]
pub enum ConduitError {
    Validation(FieldError),
    Unauthorized,
    Unauthenticated,
    RecordNotFound,
    ResourceExists(String),
    //
    Database(String),
    Internal(String),
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
    InvalidValue,
    WeakPassword,
    ResourceExists,
}

impl fmt::Display for FieldErrorKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let msg = match self {
            FieldErrorKind::Required => "REQUIRED",
            FieldErrorKind::WeakPassword => "WEAK_PASSWORD",
            FieldErrorKind::InvalidFormat => "INVALID_FORMAT",
            FieldErrorKind::InvalidValue => "INVALID_VALUE",
            FieldErrorKind::ResourceExists => "RESOURCE_EXISTS",
        };

        write!(f, "{}", msg)
    }
}

impl From<sqlx::Error> for ConduitError {
    fn from(e: sqlx::Error) -> ConduitError {
        const CHECK_VIOLATION: &str = "23514";
        const UNIQUE_VIOLATION: &str = "23505";

        match e {
            sqlx::Error::RowNotFound => ConduitError::RecordNotFound,
            sqlx::Error::Database(error) => match error.code().as_deref() {
                Some(CHECK_VIOLATION) => ConduitError::Validation(FieldError {
                    name: error.constraint().unwrap_or("Unknown field").into(),
                    kind: FieldErrorKind::InvalidValue,
                }),
                Some(UNIQUE_VIOLATION) => ConduitError::ResourceExists(
                    error.constraint().unwrap_or("Unknown field").into(),
                ),
                _ => ConduitError::Database(error.message().into()),
            },
            _ => ConduitError::Database(e.to_string()),
        }
    }
}

impl From<jsonwebtoken::errors::Error> for ConduitError {
    fn from(e: jsonwebtoken::errors::Error) -> Self {
        dbg!(e);
        todo!("jwt error")
    }
}
