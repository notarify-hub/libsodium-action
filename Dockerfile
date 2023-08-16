# Container image that runs your code
FROM alpine:3.10

RUN apk add git build-base libffi-dev python3-dev
RUN git clone https://github.com/jedisct1/libsodium --branch stable
WORKDIR /libsodium
RUN ./configure
WORKDIR /libsodium
RUN make && make check
RUN apk add --update py-pip
RUN pip3 install pynacl

WORKDIR /app
COPY entrypoint.sh ./entrypoint.sh
COPY encryptor.py ./encryptor.py

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/app/entrypoint.sh"]
