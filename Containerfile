FROM docker.io/kong:3.3.1-alpine

COPY ./kong/kong.yml /etc/kong/kong.yml