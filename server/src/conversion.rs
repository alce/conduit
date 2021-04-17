use crate::pb::realworld::{LoginRequest, SignupRequest, User};
use conduit::auth::{LoginArgs, SignupArgs};
use conduit::model::{self, Email, Password, Username};
use std::convert::TryFrom;

impl TryFrom<SignupRequest> for SignupArgs {
    type Error = String;

    fn try_from(req: SignupRequest) -> Result<Self, Self::Error> {
        Ok(SignupArgs {
            username: Username::try_from(req.username)?,
            email: Email::new(req.email)?,
            password: Password::new(req.password)?,
        })
    }
}

impl TryFrom<LoginRequest> for LoginArgs {
    type Error = String;

    fn try_from(req: LoginRequest) -> Result<Self, Self::Error> {
        Ok(LoginArgs {
            email: Email::new(req.email)?,
            password: Password::new(req.password)?,
        })
    }
}

impl From<model::User> for User {
    fn from(user: model::User) -> Self {
        User {
            token: "some-token".to_string(),
            username: user.username,
            email: user.email,
            bio: "".to_string(),
            image: "".to_string(),
        }
    }
}
