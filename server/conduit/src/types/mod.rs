use crate::error::{FieldError, FieldErrorKind};
use std::fmt;

pub type Id = uuid::Uuid;

pub type DateTime = time::OffsetDateTime;

#[derive(Debug)]
pub struct Username(String);

impl Username {
    pub fn new(value: String) -> Result<Self, FieldError> {
        if value.is_empty() {
            return Err(FieldError {
                name: "username".to_string(),
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
    pub fn new(value: String) -> Result<Self, FieldError> {
        if !value.contains('@') {
            return Err(FieldError {
                name: "email".to_string(),
                kind: FieldErrorKind::InvalidFormat,
            });
        }

        Ok(Email(value))
    }

    pub fn into_string(self) -> String {
        self.0
    }
}

pub struct Password(String);

impl Password {
    pub fn new(value: String) -> Result<Self, FieldError> {
        if value.len() < 8 {
            return Err(FieldError {
                name: "password".to_string(),
                kind: FieldErrorKind::WeakPassword,
            });
        }

        Ok(Password(value))
    }
}

impl fmt::Debug for Password {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "len {}", self.0.len())
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

impl AsRef<[u8]> for Password {
    fn as_ref(&self) -> &[u8] {
        &self.0.as_bytes()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn username_cannot_be_empty() {
        let err = Username::new("".into()).unwrap_err();

        assert_eq!(err.kind, FieldErrorKind::Required);
        assert_eq!(err.name, "username");
    }
}
