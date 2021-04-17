use std::net::SocketAddr;
use tonic::transport::Server;

mod articles;
mod auth;
mod conversion;
mod pb;
mod users;

pub async fn run(addr: SocketAddr) {
    println!("Conduit server listening on {}", addr);

    let config = tonic_web::config();

    Server::builder()
        .accept_http1(true)
        .add_service(config.enable(users::service()))
        .add_service(config.enable(auth::service()))
        .add_service(config.enable(articles::service()))
        .serve(addr)
        .await
        .unwrap();
}
