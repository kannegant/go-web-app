FROM golang:1.22.5 as base

WORKDIR /app

copy go.mod .

RUN go mod download

Copy . .

RUN  go build -o main .

#final stage Distroless image
FROM gcr.io/distroless/base 

Copy  --from=base  /app/main .

Copy  --from=base  /app/static ./ static

EXPOSE 8080

CMD [ "./main"]
