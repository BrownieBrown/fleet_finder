FROM golang:1.23

WORKDIR /usr/src/app

# Pre-copy/cache go.mod for pre-downloading dependencies
COPY go.mod ./

RUN go mod download

# Copy the entire project
COPY . .

# Build the Go application
RUN go build -v -o /usr/local/bin/app ./cmd/main.go

# Command to run the executable
CMD ["app"]
