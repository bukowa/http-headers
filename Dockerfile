FROM golang:1.22-alpine@sha256:9bdd5692d39acc3f8d0ea6f81327f87ac6b473dd29a2b6006df362bff48dd1f8 as builder
COPY main.go .
ENV CGO_ENABLED=0
RUN go build -o /app main.go

FROM alpine@sha256:beefdbd8a1da6d2915566fde36db9db0b524eb737fc57cd1367effd16dc0d06d
RUN apk add traceroute bind-tools curl
LABEL maintainer="github.com/bukowa"

# Define GOTRACEBACK to mark this container as using the Go language runtime
# for `skaffold debug` (https://skaffold.dev/docs/workflows/debug/).
ENV GOTRACEBACK=single
ENTRYPOINT ["./app"]
COPY --from=builder /app .

# Hello World!!!!