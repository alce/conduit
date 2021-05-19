package main

import (
	"context"
	pb "goserve/pb/realworld"

	"google.golang.org/protobuf/types/known/emptypb"
)

type usersServer struct {
	pb.UnimplementedUserServiceServer
}

func (u usersServer) Login(context.Context, *pb.LoginRequest) (*pb.UserResponse, error) {
	panic("implement me")
}

func (u usersServer) Create(context.Context, *pb.CreateUserRequest) (*pb.UserResponse, error) {
	panic("implement me")
}

func (u usersServer) GetCurrent(context.Context, *pb.GetCurrentUserRequest) (*pb.UserResponse, error) {
	panic("implement me")
}

func (u usersServer) UpdateProfile(context.Context, *pb.UpdateProfileRequest) (*pb.UserResponse, error) {
	panic("implement me")
}

func (u usersServer) UpdatePassword(context.Context, *pb.UpdatePasswordRequest) (*emptypb.Empty, error) {
	panic("implement me")
}

func (u usersServer) GetProfile(context.Context, *pb.GetProfileRequest) (*pb.ProfileResponse, error) {
	panic("implement me")
}

func (u usersServer) FollowUser(context.Context, *pb.FollowUserRequest) (*pb.ProfileResponse, error) {
	panic("implement me")
}

func (u usersServer) UnfollowUser(context.Context, *pb.FollowUserRequest) (*pb.ProfileResponse, error) {
	panic("implement me")
}

func (u usersServer) DeleteUser(context.Context, *pb.DeleteUserRequest) (*emptypb.Empty, error) {
	panic("implement me")
}
