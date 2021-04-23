use std::convert::TryFrom;

use conduit::error::FieldError;
use conduit::types::{Email, Password, Token, Username};
use conduit::users::{CreateUserArgs, LoginArgs, Profile, UpdateProfileArgs, User};

use crate::pb::{self, CreateUserRequest, LoginRequest, UpdateProfileRequest};

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

impl TryFrom<UpdateProfileRequest> for UpdateProfileArgs {
    type Error = FieldError;

    fn try_from(req: UpdateProfileRequest) -> Result<Self, Self::Error> {
        let username = if let Some(username) = req.username {
            Some(Username::new(username, "user")?)
        } else {
            None
        };

        let email = if let Some(email) = req.email {
            Some(Email::new(email, "user")?)
        } else {
            None
        };

        Ok(UpdateProfileArgs {
            username,
            email,
            bio: req.bio,
            image: req.image,
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

impl From<Profile> for pb::Profile {
    fn from(p: Profile) -> Self {
        pb::Profile {
            username: p.username,
            bio: p.bio,
            image: p.image,
            following: p.following,
        }
    }
}
