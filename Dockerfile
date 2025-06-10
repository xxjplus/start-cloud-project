FROM alpine:3.20

RUN apk add --no-cache \
    bash \
    curl \
    jq \
    python3 \
    py3-pip \
    && pip install --no-cache-dir awscli

CMD bash
