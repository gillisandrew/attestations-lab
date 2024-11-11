FROM alpine:latest

RUN date > /date.txt

CMD ["cat", "/date.txt"]