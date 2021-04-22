use crate::types::Id;
use jsonwebtoken::{self as jwt, DecodingKey, EncodingKey, Header, Validation};
use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
struct Claims {
    sub: Id,
    exp: usize,
}

#[allow(unused)]
pub fn decode(token: String) -> Result<Id, super::ConduitError> {
    jwt::decode::<Claims>(
        &token,
        // TODO: secret key
        &DecodingKey::from_secret("secret".as_ref()),
        &Validation::default(),
    )
    .map(|data| Ok(data.claims.sub))?
}

pub fn new(user_id: Id) -> Result<String, super::ConduitError> {
    let claims = Claims {
        sub: user_id,
        // TODO: set exp
        exp: 4444444444444,
    };

    let token = jwt::encode(
        &Header::default(),
        &claims,
        // TODO: secret key
        &EncodingKey::from_secret("secret".as_ref()),
    )?;

    Ok(token)
}
