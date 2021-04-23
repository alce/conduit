use crate::error::ConduitError;
use crate::types::Id;
use jsonwebtoken::{self as jwt, DecodingKey, EncodingKey, Header, Validation};
use serde::{Deserialize, Serialize};

#[derive(Debug)]
pub struct Token(String);

#[derive(Debug, Serialize, Deserialize)]
struct Claims {
    sub: Id,
    exp: usize,
}

impl Token {
    pub fn new(user_id: Id) -> Result<Token, ConduitError> {
        let claims = Claims {
            sub: user_id,
            // TODO: set exp
            exp: 4444444444444,
        };

        let jwt = jwt::encode(
            &Header::default(),
            &claims,
            // TODO: secret key
            &EncodingKey::from_secret("secret".as_ref()),
        )?;

        Ok(Token(jwt))
    }

    pub fn decode(&self) -> Result<Id, ConduitError> {
        jwt::decode::<Claims>(
            &self.0,
            // TODO: secret key
            &DecodingKey::from_secret("secret".as_ref()),
            &Validation::default(),
        )
        .map(|data| Ok(data.claims.sub))?
    }

    pub fn into_string(self) -> String {
        self.0
    }
}

impl From<&str> for Token {
    fn from(s: &str) -> Self {
        Token(String::from(s))
    }
}
