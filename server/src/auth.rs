use crate::pb::realworld::auth_service_server::{AuthService, AuthServiceServer};
use crate::pb::realworld::{LoginRequest, SignupRequest, User};
use conduit::auth::{self, LoginArgs, SignupArgs};
use std::convert::TryFrom;
use tonic::{Request, Response, Status};

pub fn service() -> AuthServiceServer<Auth> {
    AuthServiceServer::new(Auth)
}

#[derive(Debug)]
pub struct Auth;

#[tonic::async_trait]
impl AuthService for Auth {
    async fn login(&self, req: Request<LoginRequest>) -> Result<Response<User>, Status> {
        let args = LoginArgs::try_from(req.into_inner()).unwrap();
        let user = auth::login(args).await.unwrap();

        Ok(Response::new(user.into()))
    }

    async fn signup(&self, req: Request<SignupRequest>) -> Result<Response<User>, Status> {
        let args = SignupArgs::try_from(req.into_inner()).unwrap();
        let user = auth::signup(args).await.unwrap();

        Ok(Response::new(user.into()))
    }
}
