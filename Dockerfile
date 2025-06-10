FROM alpine:3.21

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk add --no-cache bash curl jq aws-cli

CMD bash
