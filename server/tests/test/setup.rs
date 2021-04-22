use tokio::net::TcpListener;

pub async fn spawn_server() -> String {
    let listener = TcpListener::bind("127.0.0.1:0").await.unwrap();
    let url = format!("http://{}", listener.local_addr().unwrap());

    tokio::spawn(async {
        conduit_server::run(listener).await.unwrap();
    });

    url
}
