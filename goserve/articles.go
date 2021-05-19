package main

import (
	"context"
	pb "goserve/pb/realworld"

	"google.golang.org/protobuf/types/known/emptypb"
)

type articleServer struct {
	pb.UnimplementedArticleServiceServer
}

func (a articleServer) List(context.Context, *pb.ListArticlesRequest) (*pb.ArticleList, error) {
	panic("implement me")
}

func (a articleServer) GetFeed(context.Context, *pb.GetFeedRequest) (*pb.ArticleList, error) {
	panic("implement me")
}

func (a articleServer) Get(context.Context, *pb.GetArticleRequest) (*pb.ArticleResponse, error) {
	panic("implement me")
}

func (a articleServer) Create(context.Context, *pb.CreateArticleRequest) (*pb.ArticleResponse, error) {
	panic("implement me")
}

func (a articleServer) Update(context.Context, *pb.UpdateArticleRequest) (*pb.ArticleResponse, error) {
	panic("implement me")
}

func (a articleServer) Delete(context.Context, *pb.DeleteArticleRequest) (*emptypb.Empty, error) {
	panic("implement me")
}

func (a articleServer) CreateComment(context.Context, *pb.CreateCommentRequest) (*pb.CommentResponse, error) {
	panic("implement me")
}

func (a articleServer) ListComments(context.Context, *pb.ListCommentsRequest) (*pb.CommentList, error) {
	panic("implement me")
}

func (a articleServer) DeleteComment(context.Context, *pb.DeleteCommentRequest) (*emptypb.Empty, error) {
	panic("implement me")
}

func (a articleServer) FavoriteArticle(context.Context, *pb.FavoriteArticleRequest) (*pb.ArticleResponse, error) {
	panic("implement me")
}

func (a articleServer) UnfavoriteArticle(context.Context, *pb.FavoriteArticleRequest) (*pb.ArticleResponse, error) {
	panic("implement me")
}

func (a articleServer) ListTags(context.Context, *pb.ListTagsRequest) (*pb.TagList, error) {
	panic("implement me")
}
