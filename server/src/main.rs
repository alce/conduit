#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let addr = ([127, 0, 0, 1], 8080).into();

    conduit_server::run(addr).await
}
