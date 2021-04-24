use std::sync::Arc;

use conduit::types::Token;
use conduit::Conduit;
use tokio::net::TcpListener;
use tokio_stream::wrappers::TcpListenerStream;
use tonic::metadata::MetadataMap;
use tonic::transport::Server;
use tonic::Status;

mod articles;
mod convert;
mod pb;
mod status;
mod users;

pub async fn run(listener: TcpListener) -> Result<(), Box<dyn std::error::Error>> {
    let config = tonic_web::config();

    let conduit = Arc::new(
        Conduit::new("postgres://localhost/conduit", 4)
            .await
            .unwrap(),
    );

    Server::builder()
        .accept_http1(true)
        .add_service(config.enable(users::service(conduit.clone())))
        .add_service(config.enable(articles::service(conduit.clone())))
        .serve_with_incoming(TcpListenerStream::new(listener))
        .await?;

    Ok(())
}

const AUTH_TOKEN_HEADER: &str = "x-auth-token";

fn get_token(meta: &MetadataMap) -> Result<Token, Status> {
    let token = meta
        .get(AUTH_TOKEN_HEADER)
        .ok_or_else(|| Status::unauthenticated("token not found"))?;

    token
        .to_str()
        .map_err(|_| Status::unauthenticated("malformed token"))
        .map(Token::from)
}
