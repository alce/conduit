use std::sync::Arc;

use conduit::Conduit;
use tokio::net::TcpListener;
use tokio_stream::wrappers::TcpListenerStream;
use tonic::transport::Server;

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
