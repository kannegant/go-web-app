FROM golang:1.21 as base

WORKDIR /app

copy go.mod .

Copy . .

RUN  go build -o main .

#final stage Distroless image
FROM gcr.io/distroless/base 

Copy  --from=base  /app/main .

Copy  --from=base  /app/static ./ static

EXPOSE 8080

CMD [ "./main"]