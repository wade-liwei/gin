FROM golang:1.23 as build
WORKDIR /app
COPY . .
RUN go build -o /server .

# FROM scratch
FROM alpine:3.18
COPY --from=build /server /server123
EXPOSE 3000
CMD ["/server"]
