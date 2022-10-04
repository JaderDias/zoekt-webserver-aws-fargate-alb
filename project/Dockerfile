FROM golang:bullseye
RUN go install github.com/google/zoekt/cmd/zoekt-webserver@latest
COPY *.zoekt /root/.zoekt/
ENTRYPOINT [ "/go/bin/zoekt-webserver" ]CMD ["-listen :6070"]
EXPOSE 6070/tcp