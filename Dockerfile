FROM golang:1.19-alpine as builder
COPY main.go .
#ENV CGO_ENABLED=0
RUN go build -o /app main.go

FROM alpine
RUN apk add traceroute bind-tools curl
LABEL maintainer="github.com/bukowa"

# Define GOTRACEBACK to mark this container as using the Go language runtime
# for `skaffold debug` (https://skaffold.dev/docs/workflows/debug/).
#ENV GOTRACEBACK=single
ENTRYPOINT ["./app"]
COPY --from=builder /app .
