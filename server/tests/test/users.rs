use prost::Message;
use tonic::Code;

use crate::pb::google::rpc::{self, BadRequest};
use crate::pb::user_service_client::UserServiceClient;
use crate::pb::CreateUserRequest;

mod create {
    use super::*;
    use tonic::transport::Channel;

    fn build_request_message() -> CreateUserRequest {
        CreateUserRequest {
            email: "foo@example.com".to_string(),
            username: "foo".to_string(),
            password: "correct horse battery staple".to_string(),
        }
    }

    async fn connect() -> UserServiceClient<Channel> {
        let server_url = crate::setup::spawn_server().await;
        UserServiceClient::connect(server_url).await.unwrap()
    }

    #[tokio::test]
    async fn requires_valid_email() {
        let mut client = connect().await;
        let mut req = build_request_message();
        req.email = "INVALID".into();

        let res = client.create(req).await.unwrap_err();

        assert_eq!(res.code(), Code::InvalidArgument);
    }
}
