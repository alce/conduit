use std::convert::TryFrom;
use std::sync::Arc;

use conduit::users::CreateUserArgs;
use conduit::Conduit;
use tonic::{Request, Response, Status};

use crate::{
    pb::{
        CreateUserRequest, DeleteUserRequest, FollowUserRequest, GetCurrentUserRequest,
        GetProfileRequest, LoginRequest, Profile, UpdatePasswordRequest, UpdateProfileRequest,
        UserResponse, UserService, UserServiceServer,
    },
    status,
};

pub fn service(conduit: Arc<Conduit>) -> UserServiceServer<Users> {
    UserServiceServer::new(Users { conduit })
}

#[derive(Debug)]
pub struct Users {
    conduit: Arc<Conduit>,
}

#[tonic::async_trait]
impl UserService for Users {
    async fn login(&self, _req: Request<LoginRequest>) -> Result<Response<UserResponse>, Status> {
        todo!()
    }

    async fn create(
        &self,
        req: Request<CreateUserRequest>,
    ) -> Result<Response<UserResponse>, Status> {
        let args = CreateUserArgs::try_from(req.into_inner()).map_err(status::new)?;
        let user = self.conduit.signup(args).await.map_err(status::new)?;

        Ok(Response::new(UserResponse {
            user: Some(user.into()),
        }))
    }

    async fn get_current(
        &self,
        _req: Request<GetCurrentUserRequest>,
    ) -> Result<Response<UserResponse>, Status> {
        todo!()
    }

    async fn update_profile(
        &self,
        _req: Request<UpdateProfileRequest>,
    ) -> Result<Response<UserResponse>, Status> {
        todo!()
    }

    async fn update_password(
        &self,
        _req: Request<UpdatePasswordRequest>,
    ) -> Result<Response<()>, Status> {
        todo!()
    }

    async fn get_profile(
        &self,
        _req: Request<GetProfileRequest>,
    ) -> Result<Response<Profile>, Status> {
        todo!()
    }

    async fn follow_user(
        &self,
        _req: Request<FollowUserRequest>,
    ) -> Result<Response<Profile>, Status> {
        todo!()
    }

    async fn unfollow_user(
        &self,
        _req: Request<FollowUserRequest>,
    ) -> Result<Response<Profile>, Status> {
        todo!()
    }

    async fn delete_user(&self, _req: Request<DeleteUserRequest>) -> Result<Response<()>, Status> {
        todo!()
    }
}
