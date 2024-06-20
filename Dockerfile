FROM golang:1.22-alpine@sha256:9bdd5692d39acc3f8d0ea6f81327f87ac6b473dd29a2b6006df362bff48dd1f8 as builder
COPY main.go .
ENV CGO_ENABLED=0
RUN go build -o /app main.go

FROM alpine@sha256:b89d9c93e9ed3597455c90a0b88a8bbb5cb7188438f70953fede212a0c4394e0
RUN apk add traceroute bind-tools curl
LABEL maintainer="github.com/bukowa"

# Define GOTRACEBACK to mark this container as using the Go language runtime
# for `skaffold debug` (https://skaffold.dev/docs/workflows/debug/).
ENV GOTRACEBACK=single
ENTRYPOINT ["./app"]
COPY --from=builder /app .

# Hello World!!!!