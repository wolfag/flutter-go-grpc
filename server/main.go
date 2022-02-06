package main

import (
	"fmt"

	"github.com/wolfag/flutter-go-grpc/server/model/greetpb"
)

type server struct {
	greetpb.UnimplementedGreetServiceServer
}

func main() {
	fmt.Print("ok")
}
