use std::convert::TryFrom;

use conduit::error::FieldError;
use conduit::types::{Email, Password, Token, Username};
use conduit::users::{CreateUserArgs, LoginArgs, User};

use crate::pb::{self, CreateUserRequest, LoginRequest};

impl TryFrom<CreateUserRequest> for CreateUserArgs {
    type Error = FieldError;

    fn try_from(req: CreateUserRequest) -> Result<Self, Self::Error> {
        Ok(CreateUserArgs {
            username: Username::new(req.username, "user")?,
            email: Email::new(req.email, "user")?,
            password: Password::new(req.password, "user")?,
        })
    }
}

impl TryFrom<LoginRequest> for LoginArgs {
    type Error = FieldError;

    fn try_from(req: LoginRequest) -> Result<Self, Self::Error> {
        Ok(LoginArgs {
            email: Email::new(req.email, "user")?,
            password: Password::new(req.password, "password")?,
        })
    }
}

impl From<(User, Token)> for pb::User {
    fn from(tup: (User, Token)) -> Self {
        pb::User {
            token: tup.1.into_string(),
            username: tup.0.username,
            email: tup.0.email,
            bio: tup.0.bio,
            image: tup.0.image,
        }
    }
}
