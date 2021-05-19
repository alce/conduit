package main

import (
	"fmt"
	pb "goserve/pb/realworld"

	"log"
	"net"

	"google.golang.org/grpc"
)

func main() {
	listener, err := net.Listen("tcp", "localhost:8081")
	if err != nil {
		log.Fatalf("cannot listen localhost:8081")
	}

	server := grpc.NewServer()
	pb.RegisterUserServiceServer(server, &usersServer{})
	pb.RegisterArticleServiceServer(server, &articleServer{})

	fmt.Println("go server listening on localhost:8081")
	log.Fatal(server.Serve(listener))
}
