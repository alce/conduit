all: server client gateway

server:
	@cargo run

client:
	@mkdir -p ../client/lib/src/generated
	@protoc -Iproto \
 		--dart_out=grpc:../client/lib/src/generated \
	 	proto/realworld/*.proto \
	 	proto/google/protobuf/*.proto \
	 	proto/google/rpc/*.proto \

gateway:
	@protoc -Iproto \
		--go_out ../gateway/pb \
		--go_opt paths=source_relative \
		--go-grpc_out ../gateway/pb --go-grpc_opt paths=source_relative \
	    --grpc-gateway_out ../gateway/pb/ \
    	--grpc-gateway_opt logtostderr=true \
   		--grpc-gateway_opt paths=source_relative \
		proto/realworld/*.proto \
		proto/google/protobuf/*.proto \
		proto/google/rpc/*.proto \

clean:
	@rm -r ../client/lib/src/generated
	@rm ../server/src/pb/realworld.rs

.PHONY: rust dart go