use std::convert::TryFrom;
use std::sync::Arc;

use conduit::users::{CreateUserArgs, LoginArgs, UpdateUserArgs};
use conduit::Conduit;
use tonic::{Request, Response, Status};

use crate::pb::realworld::{self, CreateUserRequest, DeleteUserRequest, LoginRequest};
use crate::status;
use crate::{
    pb::realworld::user_service_server::{UserService, UserServiceServer},
    pb::realworld::{
        FollowUserRequest, GetCurrentUserRequest, GetProfileRequest, Profile, UpdateUserRequest,
        UserResponse,
    },
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
    async fn login(&self, req: Request<LoginRequest>) -> Result<Response<UserResponse>, Status> {
        let args = LoginArgs::try_from(req.into_inner()).map_err(status::new)?;
        let user = self.conduit.login(args).await.map_err(status::new)?;

        Ok(Response::new(UserResponse {
            user: Some(realworld::User::from(user)),
        }))
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
        let user = self.conduit.current_user().await.map_err(status::new)?;
        let res = UserResponse {
            user: Some(user.into()),
        };
        Ok(Response::new(res))
    }

    async fn update(
        &self,
        req: Request<UpdateUserRequest>,
    ) -> Result<Response<UserResponse>, Status> {
        let args = UpdateUserArgs::try_from(req.into_inner()).map_err(status::new)?;
        let user = self.conduit.update_user(args).await.unwrap();

        Ok(Response::new(UserResponse {
            user: Some(user.into()),
        }))
    }

    async fn get_profile(
        &self,
        _req: Request<GetProfileRequest>,
    ) -> Result<Response<Profile>, Status> {
        let _profile = self.conduit.get_profile().await.unwrap();
        todo!()
    }

    async fn follow_user(
        &self,
        _req: Request<FollowUserRequest>,
    ) -> Result<Response<Profile>, Status> {
        let _profile = self.conduit.follow_user().await.unwrap();
        todo!()
    }

    async fn unfollow_user(
        &self,
        _req: Request<FollowUserRequest>,
    ) -> Result<Response<Profile>, Status> {
        let _profile = self.conduit.unfollow_user().await.unwrap();
        todo!()
    }

    async fn delete_user(&self, _req: Request<DeleteUserRequest>) -> Result<Response<()>, Status> {
        self.conduit.delete_user().await.unwrap();

        Ok(Response::new(()))
    }
}
