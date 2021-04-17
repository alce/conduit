package main

import (
	"context"
	"log"
	"net/http"

	"github.com/grpc-ecosystem/grpc-gateway/v2/runtime"
	"google.golang.org/grpc"

	pb "conduit/pb/realworld"
)

const grpcServer = "localhost:8080"

func main() {
	cx := context.Background()
	mux := runtime.NewServeMux()
	opts := []grpc.DialOption{grpc.WithInsecure()}
	err := pb.RegisterArticleServiceHandlerFromEndpoint(cx, mux, grpcServer, opts)
	if err != nil {
		log.Fatal(err)
	}

	log.Fatal(http.ListenAndServe(":8081", mux))
}
