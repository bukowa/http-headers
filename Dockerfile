FROM golang:1.22-alpine@sha256:f56a8a4a1aea41bc4694728b69c219af1523aea15690cbbed82dc9bac81e6603 as builder
COPY main.go .
ENV CGO_ENABLED=0
RUN go build -o /app main.go

FROM alpine@sha256:77726ef6b57ddf65bb551896826ec38bc3e53f75cdde31354fbffb4f25238ebd
RUN apk add traceroute bind-tools curl
LABEL maintainer="github.com/bukowa"

# Define GOTRACEBACK to mark this container as using the Go language runtime
# for `skaffold debug` (https://skaffold.dev/docs/workflows/debug/).
ENV GOTRACEBACK=single
ENTRYPOINT ["./app"]
COPY --from=builder /app .

# Hello World!!!!