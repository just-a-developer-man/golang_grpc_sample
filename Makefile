PHONY: generate-structs
generate-structs:
	mkdir -p internal/user_v1
	protoc --go_out=internal/user_v1 --go_opt=paths=source_relative \
		api/user_v1/service.proto


PHONY: generate
generate:
	mkdir -p internal/user_v1
	protoc --go_out=internal/user_v1 --go_opt=paths=import \
		--go-grpc_out=internal/user_v1 --go-grpc_opt=paths=import \
		api/user_v1/service_grpc.proto
	mv internal/user_v1/proto_sample/internal/user_v1/* internal/user_v1
	rm -rf internal/user_v1/proto_sample
