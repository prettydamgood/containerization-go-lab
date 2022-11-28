# Runtime
FROM golang:1.19-alpine

# Changing to the build directory. Necessary for Go apps, as the root directory won't work
WORKDIR /build

# These environment variables are necessary for compiling your app for a specific OS
ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

# Copy everything
COPY . .

# Downloading external modules (we don't have any here)
RUN go mod tidy

# Building the app to the main file
RUN go build -o main .

# Running the main file
ENTRYPOINT ["./main"]