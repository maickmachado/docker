FROM golang:1.20-alpine AS builder

WORKDIR /app

COPY . .

RUN go mod download && go mod verify

RUN go build -o /build-file/fullcycle-docker-go

FROM scratch

COPY --from=builder /build-file/fullcycle-docker-go .

CMD ["/fullcycle-docker-go"]