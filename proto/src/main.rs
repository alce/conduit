fn main() {
    let protos = &[
        "proto/google/rpc/error_details.proto",
        "proto/google/rpc/status.proto",
        "proto/realworld/article_service.proto",
        "proto/realworld/auth_service.proto",
        "proto/realworld/user_service.proto",
    ];

    tonic_build::configure()
        .out_dir("../server/src/pb")
        .build_client(false)
        .compile(protos, &["proto"])
        .expect("compile protos");
}
