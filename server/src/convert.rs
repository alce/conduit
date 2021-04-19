use crate::pb::realworld::{CreateUserRequest, LoginRequest, UpdateUserRequest, User};
use conduit::model::error::ConduitError;
use conduit::model::{self, Email, Password, Username};
use conduit::users::{CreateUserArgs, LoginArgs, UpdateUserArgs};
use std::convert::TryFrom;

impl TryFrom<CreateUserRequest> for CreateUserArgs {
    type Error = ConduitError;

    fn try_from(req: CreateUserRequest) -> Result<Self, Self::Error> {
        Ok(CreateUserArgs {
            username: Username::try_from(req.username)?,
            email: Email::new(req.email)?,
            password: Password::new(req.password)?,
        })
    }
}

impl TryFrom<UpdateUserRequest> for UpdateUserArgs {
    type Error = ConduitError;

    fn try_from(_req: UpdateUserRequest) -> Result<Self, Self::Error> {
        todo!()
    }
}

impl TryFrom<LoginRequest> for LoginArgs {
    type Error = ConduitError;

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
            token: user.token,
            username: user.username.into_string(),
            email: user.email.into_string(),
            bio: "".to_string(),
            image: "".to_string(),
        }
    }
}
