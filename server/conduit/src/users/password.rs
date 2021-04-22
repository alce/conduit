use crate::types::Password;
use argon2::password_hash::{PasswordHasher, SaltString};
use argon2::{Argon2, PasswordHash, PasswordVerifier};
use rand_core::OsRng;

pub fn verify(password: Password, hash: &str) -> Result<(), super::ConduitError> {
    let parsed_hash = PasswordHash::new(hash)?;

    Argon2::default()
        .verify_password(password.as_ref(), &parsed_hash)
        .map_err(Into::into)
}

pub fn hash(password: Password) -> Result<String, super::ConduitError> {
    let salt = SaltString::generate(&mut OsRng);
    let argon2 = Argon2::default();
    let hash = argon2.hash_password_simple(password.as_ref(), salt.as_ref())?;
    Ok(hash.to_string())
}
