fn main() {
    let protos = &[
        "proto/google/rpc/error_details.proto",
        "proto/google/rpc/status.proto",
        "proto/google/rpc/code.proto",
        "proto/realworld/article_service.proto",
        "proto/realworld/user_service.proto",
    ];

    let mut config = prost_build::Config::new();
    config.protoc_arg("--experimental_allow_proto3_optional");

    tonic_build::configure()
        .out_dir("../server/src/pb")
        .build_client(false)
        .compile_with_config(config, protos, &["proto"])
        .expect("compile server protos");

    let mut config = prost_build::Config::new();
    config.protoc_arg("--experimental_allow_proto3_optional");

    tonic_build::configure()
        .out_dir("../server/tests/test/pb")
        .build_server(false)
        .compile_with_config(config, protos, &["proto"])
        .expect("compile client protos");
}
