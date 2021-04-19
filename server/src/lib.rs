use std::net::SocketAddr;
use std::sync::Arc;

use conduit::Conduit;
use tonic::transport::Server;

mod articles;
mod convert;
mod pb;
mod status;
mod users;

pub async fn run(addr: SocketAddr) -> Result<(), Box<dyn std::error::Error>> {
    println!("Conduit server listening on {}", addr);

    let config = tonic_web::config();
    let conduit = Arc::new(Conduit::new().await.unwrap());

    Server::builder()
        .accept_http1(true)
        .add_service(config.enable(users::service(conduit.clone())))
        .add_service(config.enable(articles::service(conduit.clone())))
        .serve(addr)
        .await?;

    Ok(())
}
