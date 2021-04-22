use std::convert::TryFrom;

use conduit::error::ConduitError;
use conduit::types::{Email, Password, Username};
use conduit::users::{self, CreateUserArgs};

use crate::pb::realworld::{CreateUserRequest, User};

impl TryFrom<CreateUserRequest> for CreateUserArgs {
    type Error = ConduitError;

    fn try_from(req: CreateUserRequest) -> Result<Self, Self::Error> {
        Ok(CreateUserArgs {
            username: Username::new(req.username)?,
            email: Email::new(req.email)?,
            password: Password::new(req.password)?,
        })
    }
}

impl From<users::User> for User {
    fn from(user: users::User) -> Self {
        User {
            token: user.token,
            username: user.username,
            email: user.email,
            bio: user.bio,
            image: user.image,
        }
    }
}
