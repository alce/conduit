use crate::error::{FieldError, FieldErrorKind};

mod token;
pub use token::Token;

mod password;
pub use password::Password;

pub type Id = uuid::Uuid;

pub type DateTime = time::OffsetDateTime;

#[derive(Debug)]
pub struct Username(String);

impl Username {
    pub fn new(value: String, resource_name: &str) -> Result<Self, FieldError> {
        if value.is_empty() {
            return Err(FieldError {
                name: format!("{}_username", resource_name),
                kind: FieldErrorKind::Required,
            });
        }

        Ok(Username(value))
    }

    pub fn into_string(self) -> String {
        self.0
    }
}

#[derive(Debug)]
pub struct Email(String);

impl Email {
    pub fn new(value: String, resource_name: &str) -> Result<Self, FieldError> {
        if !value.contains('@') {
            return Err(FieldError {
                name: format!("{}_email", resource_name),
                kind: FieldErrorKind::InvalidFormat,
            });
        }

        Ok(Email(value))
    }

    pub fn into_string(self) -> String {
        self.0
    }
}

impl AsRef<str> for Email {
    fn as_ref(&self) -> &str {
        &self.0
    }
}

impl AsRef<str> for Username {
    fn as_ref(&self) -> &str {
        &self.0
    }
}
