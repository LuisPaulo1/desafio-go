FROM golang:1.17-alpine3.14 AS builder
WORKDIR /app
COPY . .
RUN go build -o main hello.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/main .

CMD ["/app/main"]