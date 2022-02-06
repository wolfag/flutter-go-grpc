FROM golang:1.14.4

WORKDIR /usr/local/go/src/github.com/wolfag/flutter-go-grpc

COPY go.mod go.sum ./
RUN go mod download

COPY server/ ./server/

WORKDIR /usr/local/go/src/github.com/wolfag/flutter-go-grpc/server

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /server .

FROM alpine:3.12.0

COPY --from=0 /server /usr/local/bin/server

EXPOSE 50051

ENTRYPOINT ["/usr/local/bin/server"]