use crate::error::{ConduitError, FieldError, FieldErrorKind};
use argon2::password_hash::{PasswordHasher, SaltString};
use argon2::{Argon2, PasswordHash, PasswordVerifier};
use rand_core::OsRng;
use std::fmt;

pub struct Password(String);

impl Password {
    pub fn new(value: String, resource_name: &str) -> Result<Self, FieldError> {
        if value.len() < 8 {
            return Err(FieldError {
                name: format!("{}_password", resource_name),
                kind: FieldErrorKind::WeakPassword,
            });
        }

        Ok(Password(value))
    }

    pub fn verify(self, hash: &str) -> Result<(), ConduitError> {
        let hash = PasswordHash::new(hash).map_err(|e| ConduitError::Internal(e.to_string()))?;

        Argon2::default()
            .verify_password(self.0.as_bytes(), &hash)
            .map_err(|e| ConduitError::Internal(e.to_string()))
    }

    pub fn hash(self) -> Result<String, ConduitError> {
        let salt = SaltString::generate(&mut OsRng);
        let hash = Argon2::default()
            .hash_password_simple(self.0.as_bytes(), salt.as_ref())
            .map_err(|e| ConduitError::Internal(e.to_string()))?;

        Ok(hash.to_string())
    }
}

impl fmt::Debug for Password {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "len {}", self.0.len())
    }
}
