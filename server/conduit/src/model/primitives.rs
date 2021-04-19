use crate::model::error::ConduitError;
use std::convert::TryFrom;
use std::fmt;

pub type Id = uuid::Uuid;

#[derive(Debug)]
pub struct Username(String);

impl Username {
    pub fn into_string(self) -> String {
        self.0
    }
}

impl TryFrom<String> for Username {
    type Error = ConduitError;

    fn try_from(value: String) -> Result<Self, Self::Error> {
        Ok(Username(value))
    }
}

pub struct Password(String);

impl Password {
    pub fn new(value: String) -> Result<Self, ConduitError> {
        Ok(Password(value))
    }

    pub fn hash(self) -> Result<String, ConduitError> {
        use argon2::{
            password_hash::{PasswordHasher, SaltString},
            Argon2,
        };
        use rand_core::OsRng;
        let salt = SaltString::generate(&mut OsRng);
        let argon2 = Argon2::default();

        let hash = argon2.hash_password_simple(self.0.as_bytes(), salt.as_ref())?;
        Ok(hash.to_string())
    }
}

impl fmt::Debug for Password {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "len {}", self.0.len())
    }
}

#[derive(Debug)]
pub struct Email(String);

impl Email {
    pub fn new(value: String) -> Result<Self, ConduitError> {
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

impl AsRef<[u8]> for Password {
    fn as_ref(&self) -> &[u8] {
        &self.0.as_bytes()
    }
}
