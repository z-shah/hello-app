FROM golang:1.8-alpine
ADD . /go/src/hello-app
RUN go install hello-app

FROM alpine:latest
COPY --from=0 /go/bin/hello-app .
ADD container-structure-test/ ./container-structure-test/
ENV PORT 8080
CMD ["./hello-app"]
