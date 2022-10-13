FROM golang:1.19-alpine as builder
COPY main.go .
ENV CGO_ENABLED=0
RUN go build -o /app main.go

FROM alpine
LABEL maintainer="github.com/bukowa" quay.expires-after=${QUAY_EXPIRES_AFTER}

# Define GOTRACEBACK to mark this container as using the Go language runtime
# for `skaffold debug` (https://skaffold.dev/docs/workflows/debug/).
ENV GOTRACEBACK=single
ENTRYPOINT ["./app"]
COPY --from=builder /app .

