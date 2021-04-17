use tonic::{Request, Response, Status};

use crate::pb::realworld::user_service_server::{UserService, UserServiceServer};
use crate::pb::realworld::{
    GetCurrentUserRequest, GetProfileRequest, Profile, ToggleFollowUserRequest, UpdateUserRequest,
    User,
};

pub fn service() -> UserServiceServer<Users> {
    UserServiceServer::new(Users)
}

#[derive(Debug)]
pub struct Users;

#[tonic::async_trait]
impl UserService for Users {
    async fn get_current_user(
        &self,
        req: Request<GetCurrentUserRequest>,
    ) -> Result<Response<User>, Status> {
        dbg!(&req);
        let user = conduit::users::current().await.unwrap();
        Ok(Response::new(user.into()))
    }

    async fn update_user(
        &self,
        _req: Request<UpdateUserRequest>,
    ) -> Result<Response<User>, Status> {
        todo!()
    }

    async fn toggle_follow_user(
        &self,
        _req: Request<ToggleFollowUserRequest>,
    ) -> Result<Response<Profile>, Status> {
        todo!()
    }

    async fn get_profile(
        &self,
        _req: Request<GetProfileRequest>,
    ) -> Result<Response<Profile>, Status> {
        todo!()
    }
}
