use std::convert::TryFrom;
use std::sync::Arc;

use conduit::types::{Password, Token};
use conduit::users::{CreateUserArgs, LoginArgs, Profile, UpdateProfileArgs, User};
use conduit::Conduit;
use tonic::{Request, Response, Status};

use super::get_token;
use crate::pb::{
    self, CreateUserRequest, DeleteUserRequest, FollowUserRequest, GetCurrentUserRequest,
    GetProfileRequest, LoginRequest, ProfileResponse, UpdatePasswordRequest, UpdateProfileRequest,
    UserResponse, UserService, UserServiceServer,
};
use crate::status::StatusExt;

#[derive(Debug)]
pub struct Users {
    conduit: Arc<Conduit>,
}

pub fn service(conduit: Arc<Conduit>) -> UserServiceServer<Users> {
    UserServiceServer::new(Users { conduit })
}

fn user_response(user: (User, Token)) -> Response<UserResponse> {
    Response::new(UserResponse {
        user: Some(pb::User::from(user)),
    })
}

fn profile_response(profile: Profile) -> Response<ProfileResponse> {
    Response::new(ProfileResponse {
        profile: Some(pb::Profile::from(profile)),
    })
}

#[tonic::async_trait]
impl UserService for Users {
    async fn login(&self, req: Request<LoginRequest>) -> Result<Response<UserResponse>, Status> {
        let args = LoginArgs::try_from(req.into_inner()).map_err(Status::bad_request)?;

        self.conduit
            .login(args)
            .await
            .map(user_response)
            .map_err(Status::from_conduit_error)
    }

    async fn create(
        &self,
        req: Request<CreateUserRequest>,
    ) -> Result<Response<UserResponse>, Status> {
        let args = CreateUserArgs::try_from(req.into_inner()).map_err(Status::bad_request)?;

        self.conduit
            .signup(args)
            .await
            .map(user_response)
            .map_err(Status::from_conduit_error)
    }

    async fn get_current(
        &self,
        req: Request<GetCurrentUserRequest>,
    ) -> Result<Response<UserResponse>, Status> {
        let token = get_token(req.metadata())?;

        self.conduit
            .current_user(token)
            .await
            .map(user_response)
            .map_err(Status::from_conduit_error)
    }

    async fn update_profile(
        &self,
        req: Request<UpdateProfileRequest>,
    ) -> Result<Response<UserResponse>, Status> {
        let token = get_token(req.metadata())?;
        let args = UpdateProfileArgs::try_from(req.into_inner()).map_err(Status::bad_request)?;

        self.conduit
            .update_user(args, token)
            .await
            .map(user_response)
            .map_err(Status::from_conduit_error)
    }

    async fn update_password(
        &self,
        req: Request<UpdatePasswordRequest>,
    ) -> Result<Response<()>, Status> {
        let token = get_token(req.metadata())?;
        let password =
            Password::new(req.into_inner().password, "user").map_err(Status::bad_request)?;

        self.conduit
            .update_password(password, token)
            .await
            .map(Response::new)
            .map_err(Status::from_conduit_error)
    }

    async fn get_profile(
        &self,
        req: Request<GetProfileRequest>,
    ) -> Result<Response<ProfileResponse>, Status> {
        let token = get_token(req.metadata()).ok();

        self.conduit
            .get_profile(&req.get_ref().username, token)
            .await
            .map(profile_response)
            .map_err(Status::from_conduit_error)
    }

    async fn follow_user(
        &self,
        req: Request<FollowUserRequest>,
    ) -> Result<Response<ProfileResponse>, Status> {
        let token = get_token(req.metadata())?;

        self.conduit
            .follow_user(&req.get_ref().username, token)
            .await
            .map(profile_response)
            .map_err(Status::from_conduit_error)
    }

    async fn unfollow_user(
        &self,
        req: Request<FollowUserRequest>,
    ) -> Result<Response<ProfileResponse>, Status> {
        let token = get_token(req.metadata())?;

        self.conduit
            .unfollow_user(&req.get_ref().username, token)
            .await
            .map(profile_response)
            .map_err(Status::from_conduit_error)
    }

    // REMOVE
    async fn delete_user(&self, req: Request<DeleteUserRequest>) -> Result<Response<()>, Status> {
        self.conduit
            .delete_user(&req.get_ref().username)
            .await
            .map(Response::new)
            .map_err(Status::from_conduit_error)
    }
}
